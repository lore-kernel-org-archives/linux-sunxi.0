Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCC45FDBE
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706031955; cv=none; b=e2zN9x3+lBDBVU7ZIajQT9fcniQcVc35ugYKG3guX8CcANxGuTunX8ky39uYC8bGFHFAJTm8k9g0BUqXBKg+lnYYRDw/tdSU3oa0AWaRq+GxxuH+U6X1nRf1TrwFoMBtnSUpiLRQcpE1kFiJbOtID5iLSuAcr2brol3sFiVxO2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706031955; c=relaxed/simple;
	bh=ZXc8X08+C4aO2O5jlqzBh0CEREPFaIm/XJ9W8jBxH/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KYbXGodI97Goe9xMBgiYLbid8PwujS/b5BhpQebUJzexjPoBVWsa9cmlkJ6am+sKlPkKyDV182Ba2+pH2NoBqkKz38I0VGD6d/8mks94ORG21JgXySJJf6NXYQ0zp7v8mWbmea6H3Aa1hNZksHDrxTTs4FHgVN41TFWGVGNWMxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXYoBqyC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXYoBqyC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e86a9fc4bso59385155e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 09:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706031952; x=1706636752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/6uOVc6gr+0+h5k4oBTqEhdhyiqp0MSyJeHam6ErFM=;
        b=AXYoBqyCg33dSaoxKX2Y9tNsfDOSlinFCImS6eeTNR0sX0VM7Urj6FIKWTXNlrZS5S
         lFTFrppztSL5PAPijJ1FesR7wVr6sG7ktcmkJNuxeI23P4MaKqu2e+9bYgZCLK4nvHbA
         jRb6Gu58yWFo/wzz95ZDm7Bmh62vBTp+a0J8MKg41opHJfNYcQgjQBLD0yCmqsdctInu
         1S3vXLv25oTCF/HHiBXsPK4pfprIgGp5M6/il+RwZzP6lktuWVaNV3gHiEw0rbryNJH7
         F4kCEW7ls9IZsUcKczT9VCJq6vg3lV7Z6NqHHCOxQcLnX6QOLg5m7Uh3uOk004mfuNZ8
         3Mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706031952; x=1706636752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/6uOVc6gr+0+h5k4oBTqEhdhyiqp0MSyJeHam6ErFM=;
        b=ul8jafrIaKYjzuOyHOTScIH8U3FeXn0KqqEar/4AmG8BogP7trTAUFxZ+Ni2j4dBMk
         TlrOs9cJsuy0u+JmJ2I8H1EZrn2khLkc40vY3Ryh0k+63M67TOPhz88Lo7ug+Tc0So+n
         z/c+l8VsRe5gpKmqXKiIQlORb9rwlXo9TNsVUrjIwHwp9+fTH/+zc9Df1VhPR7ulnArB
         eAsd6Pke3d7qljNHDXCUaOAQ51Bxvh5btUf/rnREtrmRHot7fj1rUgr+3PZLcBH1bUp1
         lX2az0dLWzSpeacDNCb5euwDpDf5a0cs+nHocrHgyc9aCPLSdtabqHMogzifKVDLr4sH
         qiww==
X-Gm-Message-State: AOJu0Yy1XfjbBdxsqOrvVzFUsDwWfgd3QHLYmWqLWhgg/05ZVESSe/2i
	d+qRv1zXxJsGOmTig/2AC9F148ZVt2Dhj8y/v7GcAXjKX/FeQ7pD
X-Google-Smtp-Source: AGHT+IFuZXYplWtmBlDewf9kxG9wih9uIsbolfMZHUhnH9YUI7jgKgcARlDQEFRaRcWgximZQPznuw==
X-Received: by 2002:a05:600c:54e3:b0:40d:877d:ca9 with SMTP id jb3-20020a05600c54e300b0040d877d0ca9mr365916wmb.104.1706031951673;
        Tue, 23 Jan 2024 09:45:51 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id w15-20020adfec4f000000b00338a3325331sm11936004wrn.69.2024.01.23.09.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:45:51 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH] dt-bindings: sram: narrow regex for unit address to hex numbers
Date: Tue, 23 Jan 2024 18:45:49 +0100
Message-ID: <13436805.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20240123083450.20996-1-krzysztof.kozlowski@linaro.org>
References: <20240123083450.20996-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 23. januar 2024 ob 09:34:50 CET je Krzysztof Kozlowski napisal(a):
> Regular expression used to match the unit address part should not allow
> non-hex numbers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



