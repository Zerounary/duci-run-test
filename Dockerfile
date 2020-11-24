FROM runner/centos7-go1.15.5

ENV PROJECT_DIR=duci-run-test
RUN mkdir /project
RUN ls

WORKDIR /project
RUN git clone https://github.com/Zerounary/$PROJECT_DIR.git
RUN ls
WORKDIR /project/$PROJECT_DIR
RUN ls
RUN go get
RUN go build -o main


RUN sshpass -p $RUNNER_PASSWORD ssh -o StrictHostKeyChecking=no root@$RUNNER_IP echo "run";
RUN sshpass -p $RUNNER_PASSWORD ssh -o StrictHostKeyChecking=no root@$RUNNER_IP rm -rf /$PROJECT_DIR;
RUN sshpass -p $RUNNER_PASSWORD ssh -o StrictHostKeyChecking=no root@$RUNNER_IP mkdir -p /$PROJECT_DIR;
RUN sshpass -p $RUNNER_PASSWORD scp -o StrictHostKeyChecking=no -r main root@$RUNNER_IP:/$PROJECT_DIR/$PROJECT_DIR-main;
RUN ls
RUN sshpass -p $RUNNER_PASSWORD scp -o StrictHostKeyChecking=no -r deploy.sh root@$RUNNER_IP:/$PROJECT_DIR/deploy.sh;
RUN sshpass -p $RUNNER_PASSWORD ssh -o StrictHostKeyChecking=no root@$RUNNER_IP chmod +x  /$PROJECT_DIR/deploy.sh;
RUN sshpass -p $RUNNER_PASSWORD ssh -o StrictHostKeyChecking=no root@$RUNNER_IP "cd /${PROJECT_DIR}/ && sh ./deploy.sh ${PROJECT_DIR}"