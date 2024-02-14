Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46EF604AB
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Feb 2024 18:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707934723; cv=none; b=RB48ScK2649OD4fulQmQMgV8ncLaXYYYAE2YyOkk4gNoLwJ+DyvoEDFTeXy5634w68VhWHtrEgPYGkV8dCWGQ+KW3UkIanec30VKPM+LGD+OT7Lv2126RudZMGPY556ecA4ot3eHXYZ0dDEYH1cVw6plSe70dmxF2o/uwdtyIyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707934723; c=relaxed/simple;
	bh=pdWO+CmZ1j2/eSrGPMC6+oRqlqPXczDz0PW1JXUoMRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/Im5/lNRtIXnNLp1co7xCVLkWig12zZiYSOMMN+c96kNli/FAgl4uiSF+0LDWqxN/h8uMNS9NAeFSNLUnpYj8mD6vnJCiwRgSBa8lLLBAw2oQjblvKFqJvwkPSvaCHwkLifIiL7yAr7UwKcsMWvVsLw0Av6xtjjBgIaPJGjiP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ubo5ihey; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ubo5ihey"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-783045e88a6so3668585a.0
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Feb 2024 10:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707934721; x=1708539521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdWO+CmZ1j2/eSrGPMC6+oRqlqPXczDz0PW1JXUoMRo=;
        b=Ubo5iheyZAZcB3nlcVsnmSc/FKHWBoWsQiZ7b7ibAh5WaA+ZkpDXm5R/9br1OYK3x7
         sjY3/3LfVTUGnXTsEYtoYR8s11VpW1ZFZ/xeRFRFO/Mnaymnf3CuCB9T15VMPD0mtgxQ
         Lguf4D7m/UtGGhePoaEJglPT8riSJ1irGAjgzq8QH4BAPwcRTFpGWZHHmXsB7iOCZpKC
         +ba/21bEsq738ui12dysJ+XGvWiMcWHhgBvCseZjH8MHw+gD7xq6vqbfSy4W/SGzMXti
         h1U7WgHH8MLongC+auw2cGY11ceQDXu7YWkaRSV3tufyDqiBJ58alkzrOp6M1t4kLdBz
         Y0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707934721; x=1708539521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdWO+CmZ1j2/eSrGPMC6+oRqlqPXczDz0PW1JXUoMRo=;
        b=AxvUzodQGAu+Bbjt+zbS4HDYbPQRg1wSYcxbT6VbTkeilJfGo/u5JsW2amOs+qEEkN
         eNIKa2Y7oRKK8oNhWjhL0YbHfAb5/XhEWYJ8roXV428z80SFH5w0YLuUyExNLdDOmohW
         8n9TuP0aHk6/DQqDrxQZFpirxJmG6OTa5shEfrfXLZkr1OQ1rHd9i8dLadMvSo0ovOHF
         pt4orydDoklArDpaBUq1bHa19pD9XBliPXO2o7lvw0ETgAfnUFYy+H3D5u5BzqzKO8m+
         0Ko6YyClZ98QNzK4dtQR7hiMe3HO2+hEelXJauOVf7+8vWfy0SWUUZMA/hJ1EpFEHxe8
         lAXw==
X-Forwarded-Encrypted: i=1; AJvYcCXq7FyhoOkJqhCFRYjWMN3PwmB48a7JldQdp5MAEcF7Q+L8bKR5J+F+UU50aHaz+k+o6vejAAWRKX+DWzl6Ian19c7ZFPi8iY+Hc10=
X-Gm-Message-State: AOJu0YwHpMup5VsZb1cBNdPcZWCvB3NQjFJY14FArupnywCxJbF20D/w
	/GqhQ+wgvPlR3s0dAa96dB7LGzGwsYxNBuqSqyTNxoHkg5dk1pIP
X-Google-Smtp-Source: AGHT+IFPOifeqiTAKueo/mPQwNX8+tB2SU886FJ86e3Ue+GP1GJcJ64cVLv0KRisjLdMfi9T0cQk8Q==
X-Received: by 2002:a05:6214:d44:b0:68c:a4a8:b134 with SMTP id 4-20020a0562140d4400b0068ca4a8b134mr3968400qvr.45.1707934720783;
        Wed, 14 Feb 2024 10:18:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTntyE0vHjRQZqbkrkqEtijdJbZh43+GlE7PqzdzftutAkh1BswvRA+WmtqZtXU5BUyBuq6lZxMA0/fmVwBzJ+i3nrpwVsh3bFtEVNHbk1NpC48NtcI/1JcNHqIIV0WL54zog6TJ5L7KR/12g+Pg5YxMwa4/Z0VVbopI7BwSSHgRm/n/wZCRDPEad+le8GxT1hk070JJSlbgiz2FKaMssRSVMyAOmsokae99cuPQwT7jJA
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id lb7-20020a056214318700b0068c88a31f1bsm942636qvb.89.2024.02.14.10.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 10:18:40 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-pwm@vger.kernel.org,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject:
 Re: [PATCH v6 125/164] pwm: sun4i: Prepare removing pwm_chip from driver data
Date: Wed, 14 Feb 2024 19:18:37 +0100
Message-ID: <6016472.lOV4Wx5bFT@jernej-laptop>
In-Reply-To:
 <f8e3fb96fe341ba0a4bed982aa731c5c7c355b83.1707900770.git.u.kleine-koenig@pengutronix.de>
References:
 <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <f8e3fb96fe341ba0a4bed982aa731c5c7c355b83.1707900770.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 14. februar 2024 ob 10:32:52 CET je Uwe Kleine-K=F6nig napisal(a=
):
> This prepares the driver for further changes that will drop struct
> pwm_chip chip from struct sun4i_pwm_chip. Use the pwm_chip as driver
> data instead of the sun4i_pwm_chip to get access to the pwm_chip in
> sun4i_pwm_remove() without using sun4ichip->chip.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


