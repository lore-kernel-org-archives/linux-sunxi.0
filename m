Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E983E5A32
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 10:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799793; cv=none; b=ro55aCMoPIlwsuQAOsrAhs1QQBIGzWDKFbIoj23PjePscW3WNKxv5Hug/kX6iOmpkiVGUSjFIp9nPLVqqHV3HSyt0P2i2n/HoaRFL2q+UM7BAYGVriQXDMp8cyursNKDyu4bzZ/6wusKykvDQ77yt+byz5eaxVIOHajQ6EPtbQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799793; c=relaxed/simple;
	bh=AEwkqg61I2qghq9yeHFLrk33B2hYIGSTQL7NqqYg8tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZjD5Rd1wivEc2DZYIV2Z4f5l1ElvUmUE3hG1IHAw7mSVxhUotT8Z4ePHg20AL6BGrQ5la2D8utjMUPec/p4JsWC099Gcp45i7zuNuctCx5FlJCGpwWIKbS/7UgCfmAVldDnfBJewTxPbQOfTlRghJQSgxR9ySHoCpv5jvcS9ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXXMEA+i; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXXMEA+i"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso20151985e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 03:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799779; x=1792404579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VogQbUFurz7GXGcstM5xSZa/4W+tRC0ptaL75OewR0=;
        b=UXXMEA+io4PnEWt426+10SloNe+ISYkEPzzTudedefqXEir/LRVVA6PPYnu9VUXVkO
         +nrC2RYFdLrb3Vt7GXkAmDpvj+kBDmSrd+0R6DZTLkH5QZXzg7tB+RD32GH1FoKxCfej
         kVySf/2HApjCgl9cN7gYAzOp6n9JbQGbrqTxdmBFgbx/iCi2espuV1JctVFYl8aofAlq
         qxHBHwSfBhpMqq4k5tGbKPFRjRax0QrcKeT37KoiL6ED3b52VaI7//3byQt/QcmM6NpI
         7rZfaq/KBo2uBcKO9yG09OMIYFwdzFnNwwV3VnFRdG9zIKKICLjYKo9JGy1wzCcEJjrB
         tUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799779; x=1792404579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VogQbUFurz7GXGcstM5xSZa/4W+tRC0ptaL75OewR0=;
        b=02MXofTkx3pTz+Ye3dR0GG3whm5Xd1vN8BN4gRAw/v5NpiyujTAj4uEifTj9TzX1qd
         pkLFxbBlBHYu9jzHnMb8xYJntyK/UMPizB1bU/wAtWSNhnS3G/EoYiaKQfqCCZ7EcFAd
         LHx+LDW8pNQVYR6eg+3H6eSp+gARbz6zWjbslyxkam/Rfen+HPYupHuI59LqdwkmFEGO
         fgF9TxTUqpJqlJDSDSV8my8qYUKWRRwqofFSvyZPJcVx6uAXVolMbixhrn58+3jG+INo
         IUQg3OmggT84H5S4ZD8W9z+iixypZhap8IgAk45GHETi4+Ww5c+nwrIORq92f9sjPwYi
         uRcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNKe28XlWZEg+/uMp70OeTpiyI3EqmQR1pDhq49ytJhVgpX2U50z4eNZvLybZRrf4DAwvX7Z0J9sapPg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIKhm4Ye9PTdfmHCFL+DUu7elh7/v7Ib5iDDDqEs3W7eZS+O0+D
	vRq59FWyX3nlo4VNANF71vF9/9ReaWp8/e9KM2HLSHZ2cpXpT0tA2HPZ
X-Gm-Gg: AYBFou3OLS/PXaE7hMX78U98aJh96PqolkDvWIouxd7sn9KdzRZLZAD81G7/eHoAcKj
	eoc3Dc9N6nHN2Iyf5MnFEwYy5Roicc1pkfclFNvcffhmg6ujqhSASjd/JThIP1EkuaV7+FeLrqe
	YoYww4PUaRGD0V7h4RYrGOg48hrShdyFX/sh19Zom+gNF14KwEnTTxG1xb20ycBWPHorWHkXrtT
	d3DfnBKQVCvOW9B0dxiPnmybG2WckaYwPjZjJKsn+vO0MU/IsikQ6MP+PilXa1dBFiZwsqIccqo
	jSZSNN3lPWJldzUrR34fUZFA8t1WTbQOpzB4goY0Bhr31oNRG4TY1g+DIJ+pOoIi8KYuOMfoxKC
	S005xX+vnvfsL4wYjVsHVmInufEaoJQhtbSSdb59spqBde1lvk3R+AFtYHkLhRsKTrJZZ6beYv+
	CKf9qbSpFAxPAm1Mt51Emg4K7rqP28EAfXXB+XqhWcw9kcVv4XIxmn9nfDu0mTomczNom02mXMe
	kG122ng8QVINKfjPrf5BERsgXDlShe6
X-Received: by 2002:a05:600c:3f16:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a18e44395bmr161917225e9.4.1791799778944;
        Mon, 12 Oct 2026 03:09:38 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:38 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 06/11] rtc: sun6i: add Allwinner B288 compatible
Date: Mon, 12 Oct 2026 11:08:11 +0100
Message-ID: <20261012100816.331033-7-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 32 kHz clocks are the same as the A23's. Only one alarm interrupt
is wired, which is all the driver uses.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7fc60880e409..05004e80ac08 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -350,6 +350,10 @@ static void __init sun8i_a23_rtc_clk_init(struct device_node *node)
 CLK_OF_DECLARE_DRIVER(sun8i_a23_rtc_clk, "allwinner,sun8i-a23-rtc",
 		      sun8i_a23_rtc_clk_init);
 
+/* The B288 RTC clocks are the same as the A23's */
+CLK_OF_DECLARE_DRIVER(sun8i_b288_rtc_clk, "allwinner,sun8i-b288-rtc",
+		      sun8i_a23_rtc_clk_init);
+
 static const struct sun6i_rtc_clk_data sun8i_h3_rtc_data = {
 	.rc_osc_rate = 16000000,
 	.fixed_prescaler = 32,
@@ -859,6 +863,7 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun6i-a31-rtc" },
 	{ .compatible = "allwinner,sun8i-a23-rtc" },
+	{ .compatible = "allwinner,sun8i-b288-rtc" },
 	{ .compatible = "allwinner,sun8i-h3-rtc" },
 	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
-- 
2.52.0

