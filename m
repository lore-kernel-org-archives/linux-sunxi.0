Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB105E208
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 20:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707682610; cv=none; b=iGNk07UOiPihPfFZ0KZiH4qtH43B7L/vhmOZWq4DR0Rud0d2xhxKW7REjl/gQdE5p9m1YrseV8U7WPUgizyoMIe/eNQ2wmm6AOCmo1KpN+c7k4hXrnlPNAFPzYXwze3VYpotFjBIyiqZow7Ag9d+ujQohUYGIUAQTt2zrg+DTvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707682610; c=relaxed/simple;
	bh=yxRao4uBYry2U5T4G+MjUlh5Xhgm8RGZPUf+qeXm+Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GKKyUImwPNzQOAgm/jXIi9mTvagQ3vsKAtzhJIZvLn3HGBAoRD+JrDjh65J3pGzmrfg0m1u0P/DW/Xhqj7/HfnXwgUQyVMv/JwlbfvLYo5KRJIfApEdoMAnGFj5rGC2W1pb21C1gYhsLCWyLZD10EA4OVBqWS6cOtJ6HEUAnXUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+KJqgpH; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+KJqgpH"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33aea66a31cso1436855f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 12:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707682607; x=1708287407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lc+nQZIXeqEFwx7GhHkvsm16lQCpiV5jZf8qJAlMEGo=;
        b=A+KJqgpH/GKZScOz8NfTW3tlTz67GQDkDOmMXfUOQCV55RxQjGDcOA9kMCtWAWO6hj
         eogYxSb01QgPAd37/anQapyVthuT6jpr29Z0BoV1HTbAK0vYZPvYM4k+i6/NJpJbGHr2
         p2K0Te78bTQhAeh/bl5eFaCBREK8/5E7o0fZ9uBoH3cVSxmqo8ma0oeUtZ8U7VjRmT80
         8PeoM0lulsURda2pt+YBYltVJCFac4hy1waA6d+j5eCbq6rdC2iHDqr69zdtNlwNz9A1
         M1ZasonXrzk7wFcs/9PmGidzM/2KsPFDkbI0ov6tEvuor3oz+5MC1eqowSS4POO8nHDy
         fObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707682607; x=1708287407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lc+nQZIXeqEFwx7GhHkvsm16lQCpiV5jZf8qJAlMEGo=;
        b=BvHoAhBcTRR9cAyhISZxJafiwFcIix5GdE98oUc6o2chQZXhqzxs9XYVlxiKaYodWb
         qIlzj0ZqTMTBtHP1vjbYDwDzIfvVXPi9hunYEdUcR2TZbCwiuRf465bq1OPYPO+GOi2n
         HAYx8Pw0f5S3TzUSBxjzN5xa5AkRy1LBRouDedPoVf8pOf1WdFjJNvGLyjTrkxy1a3bj
         lTPRs45kOrC5NzydAIS9zV8NzQDkxUf0eXkr7Guv0z95i8tm8clfZuqtFTTrquRcTX4E
         I6pgaKaCa3Kq+5scMQQ+nKIUuKHsNVxWZmLztBnAfK3iCXgf9D/h+16e2vMaENiaJiQa
         TfqA==
X-Gm-Message-State: AOJu0Yyd7fipUu7HMIxrFidkcbQ2NHwQKvFyW/Yg5AGnAPcN1x7EPWkQ
	zKdyd69OCuYnC9ZBVcoVBnRg86C14W5rM6gZTGa/IiI2kICkwMCK
X-Google-Smtp-Source: AGHT+IHS+97AymsPnKdtMWID7TXaZcRWhzwS+j09lzzKIgOvLCc1BcxN4AqdRVjwl3wGM921sHo6NQ==
X-Received: by 2002:adf:f30f:0:b0:33b:3b96:7ea6 with SMTP id i15-20020adff30f000000b0033b3b967ea6mr3570746wro.18.1707682606652;
        Sun, 11 Feb 2024 12:16:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUt6mMhEshMzvwp1Ctt877EA+SoqSVAhiMtfK1uijSYk4xoLTtuOzm3BMiMpmaAM0TikUYhYBB9wWK1yLDPHDRbnqbBcJ57Df+9qFshTcRPTwi9GnV2bGrbG89upBiuGGy8SyANqtsridfHF1eHEJ5u33DXwK8qP63JXrnRFgGQ4qJx87+LXfCfd2CEkYvkMCBNmfEpivzAHfRCcO7uiAkdeADTP2ujNxKS6WB8X6T7NIl577THXC/87UcnfZVimVTG7afz71I8WyYoGSmWxYWVBUjEuWtyRh5Bvf4HXl30mAjt85bFB7rJ4VurGsI5AfWxZPRRnb6ZlySSdRCIyg==
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id bi11-20020a05600c3d8b00b00410d41f1d96sm988249wmb.34.2024.02.11.12.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 12:16:46 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic <nickalilovic@gmail.com>
Subject: Re: [PATCH v2 0/2]  arm64: dts: allwinner: Add Transpeed WiFi nodes
Date: Sun, 11 Feb 2024 21:16:44 +0100
Message-ID: <10418022.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20240209115759.3582869-1-andre.przywara@arm.com>
References: <20240209115759.3582869-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. februar 2024 ob 12:57:57 CET je Andre Przywara napisal(a):
> Hi,
> 
> a tiny update, see below for the changelog.
> ======================================
> 
> This adds the WiFi DT nodes for the Transpeed 8K618T TV box. It uses a
> Murata module with a Broadcom 4335 chip, which works fine with the
> mainline Linux driver, given you provide the proper firmware files. We
> found some in some LibreELEC repository.
> 
> Patch 1 adds the pinctrl node for the 32KHz clock fanout pin, patch 2
> adds the actual SDIO WiFi node.
> 
> Please have a look!

Fixed order in patch 2 and applied, thanks!

Best regards,
Jernej

> 
> Cheers,
> Andre
> 
> Changelog v1 .. v2:
> - add /omit-if-no-ref/ tag for clock fanout pin node
> - update commit message to avoid mentioning Linux or driver
> 
> Andre Przywara (2):
>   arm64: dts: allwinner: h616: Add 32K fanout pin
>   arm64: dts: allwinner: Transpeed 8K618-T: add WiFi nodes
> 
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  6 +++++
>  .../sun50i-h618-transpeed-8k618-t.dts         | 23 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> 




