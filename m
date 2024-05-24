Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F5184DEF
	for <linux-sunxi@lists.linux.dev>; Fri, 24 May 2024 11:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716550363; cv=none; b=LXjKN0UFzoX+J8TAWbVKeYitF9KZN6SndJ5TorG4kLcIpqbkUuee8Fx2pGzhpr/fdnjphPCrXmknvIqjDR2Mq7Py8hMDzt+aauuju/AcJvWIKdrV49CB+TSQHn6AYJ52eo0xTriBXVrtlXo+1N13Da+3Dc3lg2N/ooR1WlNYdO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716550363; c=relaxed/simple;
	bh=+FdDMqfYCOb2sKqwmEoU3h3Dyjm499FpbBKjwJhpYlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sm3RC6c8ex6sye1oJQ3mR0DB68Hpmyc2xlDO40rroiTFvc/vVlj2dxjl/95GaN+4TYLd650g9ZCw1IsssEtgBpBa4qwVwtWrME6F/1AoZ3opcGAswHNVzE6W3jRDpoJ2ZtFbFt7pIxjkZ7TNou9PTPLx1ndemKrUO/6ODu9hq58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+ojZ5sZ; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+ojZ5sZ"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-df4dce67becso3420366276.2
        for <linux-sunxi@lists.linux.dev>; Fri, 24 May 2024 04:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716550361; x=1717155161; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+FdDMqfYCOb2sKqwmEoU3h3Dyjm499FpbBKjwJhpYlE=;
        b=I+ojZ5sZhjkVbO19ynfrq7Y+v5dKihXPxlV3p6WdAldTOlM/eTsqiWievjohdql6fV
         X3v9FpHOWruirSAu2zHrFYXzNtFAjDAnI6xfIIOKYNSX/FozjELyTuFcKrRv/eh/QCVf
         72W+If/U6rGAa7jZLHyBHVRqtJsIA6dwPAuD8bHQW8j8R2XqTOFYq+lT3gsJLKqiY/SQ
         lKv/R4/XCvmt2ECV3IJWti3bKyhbemS4ub7JW7Mcn6Z2gylpU5xGvWuuKIu4FfgKGYtC
         bnLiqdMdIlfkqpTH8w8pUlVrsLOsZ50iWUhNNHzaWEUjQgEeU4C3qjxmxquqUR6kYIAB
         e54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716550361; x=1717155161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FdDMqfYCOb2sKqwmEoU3h3Dyjm499FpbBKjwJhpYlE=;
        b=UzFvoO6BVEDJUnrI9u1FD+d3jNmNcHfQzGKP7ZkqhDBfyUNy0pi8XUVnL6j9TaGzDV
         1MIIHL7ZPP/bTw3LnRok2g60npxi2gNb3SW4yHktfxNfcvh3WNpwr2fU548LzzkMO2SH
         zMHilyDT47pbWMnhcv54fahi9D+EF5FkkoKmHNl5lECQigjyt4x4HDkb5FfMTwEk8poX
         51Snz/Pb5tjNK+4F5e4mfp2jG9ZSZQIzddAxHlv1d9GVkBiffxxAh5R145yMmf1psc0W
         DFy2PtYLn7bAk9EUvb1JyhTJssNn8g7pWKc+f/yxT1/AUylP+QXcKKlx5sh/IiMXS7+K
         Gzjg==
X-Forwarded-Encrypted: i=1; AJvYcCVcYFKj8m6nWYFt3HMMRXc03ydxp+uMJmk00xwZ39f8TeS0NznrYMb/OmFl70+Axp/gjtNi9KnVub46tHVDAaTJCq7vwPjANtN69TY=
X-Gm-Message-State: AOJu0YyteUQLbMusWSiFKAHEc4wU9tvB4ks4FcDlZnEoxMpOcUpKrMbN
	vqNxUR/RBw2quKiL8pEi93A46UZpyTN4TD3jF973wsOpc2EPnG5R7QS4y699bRabKTakNmU9kxw
	0OrWGftTqcYwxLNgKQUBh75MgDrQ=
X-Google-Smtp-Source: AGHT+IEUNT8qpSYVeFnLdK93OupqdGs3ueGj/G+IJ+fEMIu7n+LnUqnYTr2e4NhRpeaNvCqdhdjlRj2DJtbwV9uDHPI=
X-Received: by 2002:a25:824d:0:b0:de5:5255:ceb5 with SMTP id
 3f1490d57ef6-df77218a263mr1853899276.3.1716550360799; Fri, 24 May 2024
 04:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG40kxGMu-TSchNezkcC_A97hzPnWU3KxeL-X-hJfPhjr_COyQ@mail.gmail.com>
 <Zk6yK3U9tgxOxcBb@titan> <CAG40kxFxE_Oj+9aCzGku0a3KFHpuW8ai=gEkV9M8==5gwmjdEA@mail.gmail.com>
 <Zk7Z-MfdF-YKWeJ6@titan>
In-Reply-To: <Zk7Z-MfdF-YKWeJ6@titan>
From: =?UTF-8?B?44GN44GP44Gh44KD44KT44GV44KT?= <kikuchan98@gmail.com>
Date: Fri, 24 May 2024 20:32:29 +0900
Message-ID: <CAG40kxG0yM0+ge3=zX4S_MQevuNQ5oWAvtmTPXAbHHk2nmSYew@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
To: John Watts <contact@jookia.org>
Cc: privatesub2@gmail.com, aou@eecs.berkeley.edu, bigunclemax@gmail.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, fusibrandon13@gmail.com, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, mkl@pengutronix.de, p.zabel@pengutronix.de, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	samuel@sholland.org, ukleinek@kernel.org, wens@csie.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

> Does Linux guarantee a flicker-free experience with setting up PWM
> channels, or that it doesn't affect other channels?
> How do other drivers handle this situation?

I've noticed that drivers/pwm/pwm-fsl-ftm.c and
drivers/pwm/pwm-microchip-core.c use a similar approach for shared
resources between PWM channels.
They simply fail if the settings are not applicable to the hardware,
much like this driver does. However, I have yet to find a driver that
aggressively changes another channel that is already running.

Maybe you're right; Linux might not guarantee anything about this.
I think all we can do is deliver the best experience to users within
such limitations.

Best regards,
kikuchan.
