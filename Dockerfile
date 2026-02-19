FROM n8nio/runners:2.1.4
USER root

# Ensure base directory permissions are correct
RUN mkdir -p /opt/runners/task-runner-python/tmp \
    && chown -R runner:runner /opt/runners \
    && chmod -R 755 /opt/runners

# Install python-pptx (Ensure user permissions are correct)
RUN cd /opt/runners/task-runner-python && uv pip install python-pptx

# Copy config file
COPY n8n-task-runners.json /etc/n8n-task-runners.json

USER runner
