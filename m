Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717794;
	b=Kzu1+PXEk10WZB76Mgz+CQRUrkBrsjkgcSsKYmty3RwN4tANnYSJ4viGsofZDVXCcgIS
	 5Gphy1HaLKWwAMQDixTdTTuGPQ1vglRjbvBxTVChI7LVy6o6+pXNorIR+xNedFNLHlO02
	 TPE5tomOcnBq4qMCx8ldTKl/vejkwKx7qiCseOmHx1KeoQUn0n71uSaATxXjyt5rWsVqm
	 TglQ4S/e21sHI4LKWof0FJjG9CMHSXZ/zsQh3kGcU93em8hxL0ZJr1PpjYGvTqvPyJ/gg
	 y5O35NdLQ8jZ3KGRNyJf5I6+s+kNRdR43hrwlGI7RG4kIaqCuCKhvC39RkLP6FuwzLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZacRs5JbXlxo/OQerWiYpTqRNCbFu2nOrkARU1a5+kk=;
	b=g0WUOLvPcNGAmqOChCBf37a/jcP9Cx58q6Q4WOhJ+DzrPJA00oyA7qktMnqYxPgS/IqZ
	 qvcwbOiiE3GNSRfan2AgSuv+vEmoD3zF4NK+2dJndDXFGm342eHt30JEfFIJrIblkybij
	 0qgmEDkgzvkqgZ6XAHgj1sB+0p3iU+7pr6Ab3gR/QRPJdZ59sjX65fl6laz/NOPKSCszn
	 /aphOcN7Sm8NEKFbRsYdGVOoFC2YFhve3KSlk/tMQMkdvP7nm8ZhQ32CHs9RA6CT6jkIC
	 clwhW9SmwO7dmIcehB1ionSSM3CluTfuyQo6HQkYEW2nnBuwp+C8yaRQsI/lPX6i/aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFrmX17W;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9731606A680
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 18:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9731606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFrmX17W
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4287604f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 10:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717792; x=1796322592; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZacRs5JbXlxo/OQerWiYpTqRNCbFu2nOrkARU1a5+kk=;
        b=IFrmX17WPR0NHw0xnmmvZ7d2mOK/vI67G1uodo4qqgpwLvzmG9K0w1dbJ3ZKInGLX3
         hHSv+YsK5TDEZInREavwSFBR7kxh6aM/UzkJsn2oF+vcu6k0Z23iIvdrhAMrwUwsR9KF
         1qZVHWbV/GAobVoRKh79MyLwq+s1HJAo/C+RFSGXekDHt4fMttFE9odtQDYGX+jnCjGu
         CyaiKJl9XbVAoYZLcCPgmbpKh1NaO9i/YOXh5NRKgOJguUkyxbeBz4SXJZeq4bRIFICl
         n2f5+dBavSI2FV/qhkCEVd5R4VoqxuZjeDHwDoBkkmtzv5f9TBciy9/IJKt6PuxXS1T7
         jscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717792; x=1796322592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZacRs5JbXlxo/OQerWiYpTqRNCbFu2nOrkARU1a5+kk=;
        b=dla0OpI2SXqm1OnShIfqDlPrgNIpel69WpSTO+IedrbCYH7QFq4IMfhr+t0UhVc0sp
         tbVvUtxLng50NqgYqN8EzG9gdrUxVRpxp0Zq6y78DG2RmfAmYsoeZ0PKvv9rqmp303rj
         o1qEdJ3Rf9YNj3J49LV5y1P6Rs5zHFqG7oiuGf5QOxBcfMAXwUKk+wOjSiyGpoKCmM92
         CyiQt0SM6chJlwNbmueTdbYx4tPCIgfDRyj07RvP4ewp8ZGZOLD00ewBhNbuzSmXIYLG
         PGOrCms7YLyoNaiFxvWUUxX7nYZ9Y4cmtZwHtXYxeIvnW9VvA0O7yKMjcPamaxHYWISG
         m23A==
X-Forwarded-Encrypted: i=1; AL+hErGmR0kgLdqSV0JXQmqERlllgCVpnfp5mJ33iwgRASGfhxpt6FGs1vRf3cwGhma893gmb15jlUOppGJ9eA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9cbzVMjx/CzET7RhiguJ08lipZWdsaWOHCA/IH0r7FXV2pMJ9b
	ZMVNe47juAcqxxkl/hbcj70JMO6mY57PJrzLJPkbKyIWVgEzaNd/1/ZT
X-Gm-Gg: AZFdTZctH6rVEcuBqVo+oDssIwYoVYD/YD4lU02LGMu6aqLHNdtCRioPgXOWVXTtOpv
	Y9/5UDeMI13exea0HrmzKZxQlUzw+4ML5lj0qYEUBdPy/J76HOF+f+w0pQXZR0HzSc1VkYX1GnM
	c7D9Ck/dvjo6nYBQDzX56azlObg68WiGVqDo/rlrQqD1vePjo34pveaQUzokhBbN4x1auFUSJ9n
	JN8X0ACMSS2osZnHR+wDLwOrvRxW2FVaV1bZg0Ms7meJjSU2yIJdh/SjEWjilb7yNTbW3j8F0vi
	2976//v8huw4zvVjbZj2z43+YAUWD07Ym2MQZKecOv4xJdtdI9dhldVprHzOSecKdYrTB6CxI/L
	03yQpHAD3moZNONkJWE29O2amaLvL4ZT2haCSGbrWgh5MML60mqk0igKTWcLvY9PACNi2kCxwAB
	szVYL9uMSOQ/Cu5QgEs85B7qMNufIlZtkSIjPY/br7OKhCYyfG9tYiMI7LIK4u5A0GsYG+sozFQ
	FrXZm2UFrmNSMjxrWSiwMlMQgWYTHdUtb2+Mt+obX9mOW9k6PjvTkui2VEWGq94ZVT5HlICb+QO
	iCMR7b5PiZy+U0nAaxmRud8cscyEI9ETU6BUOFnN7/m2W+LYyCrEKasrcTrc6d4xp9p9T2OcwFB
	VrtciLkNWePUFv6xRZnP23SE5itv5njMF9RLA3SRpY83m8AHD4riOwZSeLBn5JwiEHFyhvQGdZ4
	0465GCemfjNEcRXsWnK5ia6FqEm5+eLSC00xFohREH+MD1niGhqH6HJ48qG3KSUfYXLIRyvHjGj
	dDRNXeFDswJ9slb7itI439nVacxLcFVHBqH7UqBYQ==
X-Received: by 2002:a05:6000:4284:b0:4a8:647c:f964 with SMTP id ffacd0b85a97d-4abb6d04d79mr46331265f8f.57.1795717792277;
        Thu, 26 Nov 2026 10:29:52 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42382159f8f.41.2026.11.26.10.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:29:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/3] mmc: sunxi: Distinguish CRC and timeout errors
Date: Thu, 26 Nov 2026 19:29:44 +0100
Message-ID: <20261126182944.3136900-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
References: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver reports every command and data error as -ETIMEDOUT. The MMC
core however relies on -EILSEQ to recognize CRC errors, which mean
that the sampling point drifted, and flags the host for retuning when
it sees one. With every error reported as a timeout, retuning is never
triggered.

Report response and data CRC, start bit and end bit errors as -EILSEQ
and keep reporting timeouts as -ETIMEDOUT, attributed to the command or
data phase that actually failed. Report any other error as -EIO.

Currently supported SoCs don't implement tuning, so this doesn't change
much for them, but it is needed for the upcoming A523 delay-chain
tuning support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index b862df26e192..c2e84c22d3fa 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -537,13 +537,29 @@ static irqreturn_t sunxi_mmc_finalize_request(struct sunxi_mmc_host *host)
 
 	if (host->int_sum & SDXC_INTERRUPT_ERROR_BIT) {
 		sunxi_mmc_dump_errinfo(host);
-		mrq->cmd->error = -ETIMEDOUT;
+
+		if (host->int_sum &
+		    (SDXC_RESP_ERROR | SDXC_RESP_CRC_ERROR))
+			mrq->cmd->error = -EILSEQ;
+		else if (host->int_sum & SDXC_RESP_TIMEOUT)
+			mrq->cmd->error = -ETIMEDOUT;
 
 		if (data) {
-			data->error = -ETIMEDOUT;
+			if (host->int_sum &
+			    (SDXC_DATA_CRC_ERROR | SDXC_START_BIT_ERROR |
+			     SDXC_END_BIT_ERROR))
+				data->error = -EILSEQ;
+			else if (host->int_sum &
+				 (SDXC_DATA_TIMEOUT | SDXC_FIFO_RUN_ERROR |
+				  SDXC_HARD_WARE_LOCKED))
+				data->error = -ETIMEDOUT;
+
 			host->manual_stop_mrq = mrq;
 		}
 
+		if (!mrq->cmd->error && (!data || !data->error))
+			mrq->cmd->error = -EIO;
+
 		if (mrq->stop)
 			mrq->stop->error = -ETIMEDOUT;
 	} else {
-- 
2.43.0

