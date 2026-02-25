Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8422285C9F
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Feb 2026 17:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039354; cv=none; b=hcd+ekiU2YNJMYiSfP9V/1YzCzL7Ds0WimCKpoo+FUS73H6GgwrsegDaw0SlXvc9nGAJbgKSXyI24nVwztXcvIPFNOd8I35dOZLFY0eopVoE3/3Hb3WxEJjm7RLeHstXQWt/8nnPFz1EHUFe+l+zy24xSApncpD2xNU064JSF1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039354; c=relaxed/simple;
	bh=opzPiYITPDzkhL0K2KwNxWZZH4n+i8pY3gCo6iOBE3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tjaAtRKL9cCVJFK/dN04NY+i6JI1JDMSFcQlaDny2PPBeL5t4BFf3v11N3T1JVjX9spB5Tqr/3CW5tgJZQqOmfQwSEvmaIbnbYA1G7oyYTjgPQH4LZz2sqCufqA8uOx63jlf/R25a5o0kERjXTWJuTsIsvRA6tS6/tFCZugVT2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+S+EIei; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+S+EIei"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48370174e18so38648855e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Feb 2026 09:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772039352; x=1772644152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opzPiYITPDzkhL0K2KwNxWZZH4n+i8pY3gCo6iOBE3o=;
        b=W+S+EIeiE2it2aaX7U9zZXYeYkBJXWW1wyO/uCmGCEjRL/TiGm4sJJvFOp1/d2lFQi
         AWQwnyFy13J727oQfSyufAC3wz9ECkVOytsNEyv5fqpiGqqBgNNZm/1zplf0BdiKUl3f
         8wv0JG7W5BBMoKqag5Wh24n8y2wpCT0wZJ2CFQIr8u8mzqcbBkQMEE4pDZioPuThwu1i
         dUO3aqYoeL+bH0MRCPP+SC6V+ks4W0ltzcUpkYeUsJgAAhfyKESE57VZ3mgS8Pg2BgA6
         ZJ49EkuzlBuAx7eZi5c7qBHSYSQ/dpfjt50kah6ADqIGB3ReFFYKChypLl2CLe32DdWD
         WN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039352; x=1772644152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opzPiYITPDzkhL0K2KwNxWZZH4n+i8pY3gCo6iOBE3o=;
        b=MS2WH3XwQntvA7bIfNgQdoMOrZIVcC4xE+cmTgdysVoIR/EqJ6haMNSPz9q83U//mO
         fF/Sww2vrKPgTHJfeGDximW2d14pw9TQMKj+8eG7eLHzmsO8NdSAyYqnk8XEUduBg9cZ
         +bNmP47L2dq0HhP+IO+pe2Fdir1IXtPUqGGCXjM5hScHSHtarhHgOvQKqp+S4eI/dIxk
         xui1/QcDdthoj+viztbxLLfxXzZu5SEjn4Pb9SOymaSRJ0vpYqG9WN1AZZZvIxG1dWBA
         Mq6E5/q+2zPAR/uGOpoiiR2K6sTV6tTR/W5PFan987LQ+MqJ9mfq80Ti0wMxdDzdMxZU
         7UKw==
X-Forwarded-Encrypted: i=1; AJvYcCXMF5bWiP4dGTN7JW+ydGVXvD4wKaeIQp5U3O8jKJ/saLOv5Ohp0F+MOUTjqPVdKZk9xlflH3QLA2Ijtw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMNBe+8OcJgewLTbwBQiso2MnzAzmpMZrZukSFF0fW39NsNP55
	j07ITV6UUCbv1cBeMsZ+TkcZWWzzs/QfbZoZX5uExyIXlVkcmFqEV00c
X-Gm-Gg: ATEYQzz20jJm6aK5P280YI3r96gTzHcp42Bk+r0tp90U9hF4a4Q1vpW9VUSqTtZMjjN
	CZ86bhHxKksFxTwNNuxkgz3Ku9RaQLgJVdSSER+G4yFm06asKY5wmjIzczj8ZtmkWkr2+E97WQW
	1L1blC+BjGieW5xzex9Pqv9JlH5q+kqCjlppMUeFkI1Gth5owh2AfXm9SUX2s5JezVmDtRzas5I
	+NGVN7JFfO8BAbMA2IWG6a8WgH930RzJb+YcvJWSWkK49KBZ+IAbbwptQqq7WSshE58az9PWkHk
	kCo00G7QOAeInzxKYqhZxDFWTYIiH83SE1H3RjTAdpXQHmU4HN9+QaU3eF9duyb+CknkrTNAxgb
	seysDYQQ2xQWw6gLbjvkwZVkc/TeiqegRnF0KZJWp227HpzCCzmss1MO2kf5ecowF0OWGXxLpEh
	b/H5ViJXMd710wc1c4NGOM/SV9dlYsRb/pvvCfPPcGyt4NIszNYaBmNW50HjxsCJPJkeZkL9Jah
	Y7A/ISudS6ZxybViw==
X-Received: by 2002:a05:600c:3acf:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-483c21a747bmr20503405e9.30.1772039351955;
        Wed, 25 Feb 2026 09:09:11 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f26d7sm91050645e9.3.2026.02.25.09.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:09:11 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: pine-h64: Enable USB 3.0 host
Date: Wed, 25 Feb 2026 18:09:10 +0100
Message-ID: <5050123.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20260225170045.1707778-1-wens@kernel.org>
References: <20260225170045.1707778-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 25. februar 2026 ob 18:00:44 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> On both Pine H64 models, there is one USB 3.0 host port directly
> connected to the SoC. The VBUS is shared with the other USB 2.0 ports.
> Unfortunately the DWC controller binding does not have a VBUS supply.

IIRC this is exactly the reason why it was never added. Adding it without
vbus property is not a good strategy.

Best regards,
Jernej


