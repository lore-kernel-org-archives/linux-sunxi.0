Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B385171E60
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 09:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000240; cv=none; b=OGvM2a6yKhIMVtsbUABkEe0sZZ4frG83y2rNy92L68vxf9R9QlMYRBuIvuGx23EQsRfqhjwIs92Fh3CTvDiYi6VM/0sELKz66uZW90hI5/diZWZUe/Mjj+Qp1gcGomXLdzzFEz/fLnimSiBUcCHnZPS+/NLihmxg+LOf0/nc9rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000240; c=relaxed/simple;
	bh=y/2i9xAdynMCIKKj977aVCl8uDEeFBvS+ERij24gH3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CuH5UfBNgqPS5W0lqlVDawCNtSsQOQ3ePTbqh2Ksah2+w/FyT96179CoA21+vQ8JDum3rANj6+4DWRBbaeCNhFkoZQMW9NGORETFeBuofWYMzZwZzWvgD9u7KpN8QC6rIuNYEjECqol4RUpMpZoXE5snjHOebjtr9Vx+47lt90U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYP0fwQg; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYP0fwQg"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57cd26347d3so3344835a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 02:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000237; x=1720605037; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/v+B5h2PH1m+q96jJ+7IvzomlXuROk3OZZLA8dWAec=;
        b=DYP0fwQgVwCZ1yn+Ujn5fbABoyiIxjWODXgbHV1Vmd1mfYTbiKjt4oHWtqItMSiGZg
         V59ELS/MTb7PDuPlFSfrUnDJHYVes5PA6gagBncHpc906YpQrxtCpzU1dHz00RzneNLp
         8pneEMogjKJdSjREusPUJXimvuWBccSHBLa5Nsb4cBuaMhRJmrGQnnSbys35aZCTyUUh
         loDgTnLpra1BmmYiai/2U+297haKKjvytELNaXoTFIlyH+hBA5u+WyEOM90drWEt8z1V
         JSdA8eN4D2uUNjczDlY4ry/OQdBM47C3RxNyCSzDFJz82uhue2nHdLlvynnRDQdRszpY
         Q7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000237; x=1720605037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/v+B5h2PH1m+q96jJ+7IvzomlXuROk3OZZLA8dWAec=;
        b=eNdcz9eLFoWm1hSaFaqp+y2DKXIBuy3JVOA6fnZxDc+pGEYuf3Icd4kRN+pXOZl4Vo
         rsMJxBB/5amG5zX6KXSkaxyeWWTlpmxzvBabNMziHPB1dQa6+/OUsthsuBqxo9RreMWI
         DmIA1Ttnx1+jDE90r7lSKQ2dPfjPDvZNwFT+Wu6NMNPlH8TqXaLGGCVy9UBDzpYfHahz
         /gYQ1ruShMIdRxlWcjynfJLk7LRaEDrGQPAdHd5R+XqzxLcbhXinUFd/81P5asSW38Au
         aKzPyEvxUAhVscOQZfyx5UyqRECw3BW2ikTJkWbkZQCQo/k+0hdR9jLuUmQeJY9Gelxm
         S+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVUKDdMX3G/6C5B8v4LsVteKDtHD5vnoAmX9WbbsokqQcoU7VDOG8RptuCg/M2lGyQhV9fYybOqsh/+DrpGvKvUZiqBy0fAw7CRGZc=
X-Gm-Message-State: AOJu0YywJKNavGHnuR92suMBXeNOoiPa6yDu/8WyKUaEWjCtWAlGRhYe
	r58aTYiPm2Irt2puf5jR6mZpO3i5IsDlIkYFpx1490wbzQ4IrFQg+gTCHB5u
X-Google-Smtp-Source: AGHT+IEIY4dIoxPJludnffZYVCFFdIx0eviJTJj2qywdu4egDu5miCN1B1+FWYpxH8LMM6MLKJZmaQ==
X-Received: by 2002:a05:6402:35c3:b0:58a:e810:227d with SMTP id 4fb4d7f45d1cf-58ae81f67dfmr3569556a12.21.1720000236940;
        Wed, 03 Jul 2024 02:50:36 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:36 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:20 +0200
Subject: [PATCH 07/10] clk: lpc32xx: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-7-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=760;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=y/2i9xAdynMCIKKj977aVCl8uDEeFBvS+ERij24gH3E=;
 b=Mp1Bzj4pQqStVgM8m4kQKFq4aJg6t4Fn7Xr88JURvNcy0mwlGzsq289eVMQClPqQGE4zzTNJQ
 l76GeFFivBFAiHCY1+doTXdXhw5oYcuQ9gGfIgcLZeBm7FzaG8Rz0MV
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`lpc32xx_scb_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/nxp/clk-lpc32xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index d0f870eff0d6..e00f270bc6aa 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -61,7 +61,7 @@
 #define LPC32XX_USB_CLK_CTRL		0xF4
 #define LPC32XX_USB_CLK_STS		0xF8
 
-static struct regmap_config lpc32xx_scb_regmap_config = {
+static const struct regmap_config lpc32xx_scb_regmap_config = {
 	.name = "scb",
 	.reg_bits = 32,
 	.val_bits = 32,

-- 
2.40.1

