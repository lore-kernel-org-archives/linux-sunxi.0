Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92BB1CF298
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Sep 2024 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725441073; cv=none; b=B8MwlmBDh0maLJYIwlbPJn/lq44eLT4KRaLuGXfcPokDkYk0VcGT7tB5haVUsvbpwWoLniOjoh0waXEGg6WMKtDIJ/BQcOd+j0PyDWfSR4QQ56Enuvv/VYoDw0pwB2VLfAoo95VkGNPcXAXbgRsKKUb1z9fKRQ0akhRk8OT9Z8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725441073; c=relaxed/simple;
	bh=cM2f0dG0VQyF99xbhWY+KiTBBy7/C6FNUVkIJnf3wEk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HMBFoQ/mmVB1BcnSi6/m43GiTBTnTIUoYoDUt7/UaLamjYSnMQdBPE7kp6DVPHyMujBuZwJXWUm+KgKrB4v2cIzIzL9SqWNZZ7z/TZidloFk3P9oU6QrLgT2avE+Dhs/XDd8NwEnGN7giiivQ/NyfcLd6+GGHhSwXpHfZ9TSYtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx84ZFxg; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx84ZFxg"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f3f0a31ab2so72464491fa.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 02:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725441070; x=1726045870; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/jr368aG0co9FAR9WJq7IbEV6npZeholgnGTSrerorM=;
        b=cx84ZFxgPCDxP3Uj9wdfeVPaew8Zx/bKWyPIj6ZoG7WVSBY6OhimKu00DEuvrqaHz8
         6zgpNXd5hv61zAizDetMTJr06v74iEwv7dKVYfzQEBUrx1Cm32F+D7ckITDXyKDSbxDj
         HOqJ6rFOvkk7GzQIEYBBaa4gUxV6kJz13aRxI5U1cxCwYjTiRyPQuPH0zhf1/AmB853u
         1L9r3oO+6Ds4jK6jeN3+/zs2F4FnrUxpvmHM6T2j7taZWdxLDsim4y7MMJ/HJFqRH706
         KOK6Q/vwaRMZc+Tej8qANhRyHgQnArI7E5JDg1bX8XM8bib8T7FkHMnSD5vaF5qRvYTK
         VynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725441070; x=1726045870;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/jr368aG0co9FAR9WJq7IbEV6npZeholgnGTSrerorM=;
        b=scPA7d7B3lExygvaNCz11CkaD9u+gqoJj4y42l9VKStoypWi+CaBMuZpr3z5nLdB9Z
         lXoHmocS9aZx5Z44Lq+vr+t1yQ5cQ+UGIbJwxeSrNXkfeYvx7rfqV6sdFkyueDFDHn89
         sqKu9E4qZbmxYx0w10oDc6m8KNPw4PVJVM/oGxlqXhqROG9epuZ3BpHgKbGgGqeOqqa6
         KTkTc60xFGhjzjyHyVakAn883WTxqWLjzCa2h++dgzKLv5r3+xXxhMxaXqcdXSMXQg3g
         3c0WKD9YjrDEAxnuJhi+M+yFLWXNxfmHu3XUoggFNr5sIRM5h9glLsfKvJcD2uAsHLfT
         ie6g==
X-Gm-Message-State: AOJu0Yya29RDD3MTwsk03OxmLCTOiyCtIKP6Zao+dN/rzib0eCZsoEL/
	P/XU7sko9lIYnyELgCRWfeu6tRpdrVN02qmduFlbn3smOvsPTtImNfBt5BuLRQGIHR0D+U7FqEB
	0F0dmHbRgpXDNCOzfc85JAbLhBewg/sEI
X-Google-Smtp-Source: AGHT+IF60WTW3WDYTimpgIsy+8P/nXftIwP1VudA8hwKhcmfTyek+WuroMqADU46msozOIe34x36a3l/erFOdtAWHJk=
X-Received: by 2002:a05:651c:1505:b0:2ef:216c:c97 with SMTP id
 38308e7fff4ca-2f6103a520emr134795811fa.19.1725441069369; Wed, 04 Sep 2024
 02:11:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: uis <uis9936@gmail.com>
Date: Wed, 4 Sep 2024 12:10:57 +0300
Message-ID: <CA+vsu7uNL0N9XQp=gxA4wO14iVAHqo8ySFXuPPkQiTqMqVJJzA@mail.gmail.com>
Subject: [PATCH] arm: dts: allwinner: a10: Add DMA for emac
To: linux-sunxi@lists.linux.dev
Cc: wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"

RX DMA should be already used by driver, TX still isn't

Signed-off-by: uis <uis9936@gmail.com>
---
 arch/arm/boot/dts/allwinner/sun4i-a10.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
index 51a6464aab9a..299e12aadf9c 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
@@ -314,6 +314,9 @@ emac: ethernet@1c0b000 {
  reg = <0x01c0b000 0x1000>;
  interrupts = <55>;
  clocks = <&ccu CLK_AHB_EMAC>;
+ dmas = <&dma SUN4I_DMA_DEDICATED 7>,
+       <&dma SUN4I_DMA_DEDICATED 6>;
+ dma-names = "rx", "tx";
  allwinner,sram = <&emac_sram 1>;
  pinctrl-names = "default";
  pinctrl-0 = <&emac_pins>;
--
I had to resend message as plain text
