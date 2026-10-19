Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440439;
	b=npEDIRR3ZVOWAzW/w3jXN1zukN/cQupIXdFS02Acd0pMm0MhIDtW7ITK83hrIH9BNWd+
	 By/qUpux2gCSYy5k7140UeZVgwZruKPkE5HXdO+T4EIaTDQS1owl6sf/TSQ+gm9D8Wrtl
	 rrnSy5n6as4mvIR0+D37xVdVi0RhgXNKffjhcfdK/y9qFvI1z9/HebiuKo+nFElqcCeWT
	 0xhKKsvhdlKFNoqfZS17BqXm3pnihX+R1R4b51tiApwWkX/A8N8HDaFagK8Q/Z7yrNG9x
	 Z2G5jmt5s01WPycr2dsOnpLwWRAsfGjWnOsM6esWxKBRORjfUZGJyt3FQPzR03Om5dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YPV1ND+Y5cr1ZRV7QTF9T5CIKQmib3RaWdAMyy6frHc=;
	b=jhk3jS0BqCmSl7zmJIY5GigWbg+LcBGTxJqeuIPyxnn/cdyEzs43PWn0LGzFmSpJreyK
	 qo8ER1Mnd2kUhb9JHgOpE7yEkc5GsSyghmfBaqyhAox4hWnbp3WzfL5vKEGrIoZiWuRNg
	 MwyYn8QHwXQuwY/kW/hhFB2GXfB1oVRLU9ay+hga0n6r2zxC4iOW90nvnxbF523VoBGct
	 JQlnmNXXvbVGUCOAZsAGh3zQfxRCyHzs3zFBdkoyIUWpH/+TM6rNT1f5q0wUKsv+ZeFbU
	 uJnOyjr3gKkgZCIayDeWcHJvhj5A9oNdSv+wWj3RfutD3/s50VoUZDjxinPVvMMS+VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DAi697Xq;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDBA606A31A
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 20:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDBA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DAi697Xq
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5e948e56af3so831792e0c.2
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 13:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440438; x=1793045238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPV1ND+Y5cr1ZRV7QTF9T5CIKQmib3RaWdAMyy6frHc=;
        b=DAi697XqUyXqJu1Yts/6cUdMAKLiQa68K5crfUgYxBb6jEyZK2vLNPb9aDRVuoTScB
         P2lyYZrqACD5T/t4dEEqRMZDr1k/wo2VIHn4gDsDo3/t1psuqvO+EtUyC0XMfv2rFsHa
         wzgwDUbu687v3TPvWijRckWJWKS2AF32Ea5PJK2kIzUi0TMDq9wqGIW0PT1kvKaUjVvI
         6YP+1gv3OOW5Mg/O0XX6Ayx83WgrcQ0KekWg9OEcC7zkqZUc/4WdDL63l5DJyBTcyLHl
         oZ4f8CUrBtUdq965V5vofZQcdQl75YGZOJ8xjPVZswvBAmpiI4Bro8UYoP/fVMyaUxdg
         tzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440438; x=1793045238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPV1ND+Y5cr1ZRV7QTF9T5CIKQmib3RaWdAMyy6frHc=;
        b=h1/1qJBTyWRUAbzYYEFfHv8QieFW309ilqeJF43UzbsWyUMtZ0h+WFbE4qWDpiDuxY
         xG1hoxy4JTbYFICO/ffUmoX6Aw75rL5l/eP0v/ziA5j+j5v2VpOVFo1IEEEAP9ZyTD26
         ootKAavhlT9qWFvcesmMUGBnd/oDB9iVQYxCcgW0Tz2Ws93lnrtm2+bp53llcBQp20ZW
         /2V7EfG3dKZbmwEya0ccUY1IrSJzZGqEwrWdmTWNizK0768sLHirGUyWzntzkUtowP9s
         VBqHuO/81W4t47xnGBoGEUgIKRKqzQlg/j9QVP3qdJ7+fQZ0K5jhhtJg4GdIEKLFmYDF
         N32g==
X-Forwarded-Encrypted: i=1; AKwUvBy9zBINGlADU6Hyl8jhV04xUlvacKFatIS+NCo4wS7ms9y+Vy8oQnndBSW3PJQ03h1gXBhBpGBiMjOUAQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYII3Z35NxQwFLubsJ2Ph44SGtmhxj5wgYIFjjK/vWf3JvDJCLaJ
	NVZZw2Afl8nJDIz4Dfaq4urTejaYT0v7odghi9rfghLiTcdtK5MzqaIvt2crWlvSImXgow==
X-Gm-Gg: AYBFou3vS0RAqZQ3sH4DJB8Nioc42uaPZNqoZ7D8G3g6P3c4xEy2I71e7Onuij265i9
	x+FfxLYwxPEb50jWXSNclNDkXtPWsYNWNZhU7v+GuPXHB1O9Ez93xiYNeeKGYlOmIlLtJJQL7fR
	wVobLBMGN2GrBNYUKYr7JHEwxEIsbzXbLDh6h8qKIoq3RJvnXVV3EZh57iDcmSRzFoJBmzZDO48
	Yo0T9YwflDhqmCOGx18Fm3Per4vOdgXuBjaC/+Io0ye3JCh0QXDDOWu5t3kTbNVScFePbTYaXyI
	+BILHoCSPjAjs8ZlN4Mv2329dSTnoze0x83/TFy2AME9R5cflKSSDECPHCsng5/d30fDNOYkN21
	YnbhLWAu6cRXNgTgHeLTkxd9JLWnjcDV+hTL0wOGv+o9NjppYgCATMViI2THFDBRXN+NDcqPyg3
	O0FqtGv0EfWDRU5kOR7ftN3wV53dhlQVf4VFYrULvq+4vfowyLv/VApmMCzDO8IvjIVHsbDsp7H
	eqI5wfFIpuU9eUan2cWaC6ORpmakYY6HEWb5rccscVMCOyvhI5YHO+WaNCA6HjfR/C2icFsIHTm
	AYwKMAJ+/9LXCNU1Rg==
X-Received: by 2002:a05:6123:12d:b0:5ea:c214:b5cf with SMTP id 71dfb90a1353d-5eac214b927mr1447944e0c.1.1792440438123;
        Mon, 19 Oct 2026 13:07:18 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm10451611e0c.3.2026.10.19.13.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:07:16 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH v2 4/4] serial: 8250_dw: Add Allwinner A733 UART
Date: Mon, 19 Oct 2026 17:06:13 -0300
Message-ID: <a3505ad8e74a08faa270881f0efbfe0d0d82d6e0.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
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

On the A733, dw8250_set_termios() stops the UART clock around
clk_set_rate() on every termios change that reaches the driver. If TX is
active at that moment, the character being shifted out is corrupted.

No baud rate change is required to trigger the problem. Toggling only
CLOCAL or CSTOPB 300 times during continuous console output corrupted
bytes in every run without the quirk and in none with it.

Use the existing SKIP_SET_RATE quirk, as the JH7100 and SG2044 UARTs do.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 4c86aaf9c121..718ec44135e4 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -906,6 +906,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun60i-a733-uart", .data = &dw8250_skip_set_rate_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
