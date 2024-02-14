Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD5E111A2
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Feb 2024 18:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707934600; cv=none; b=pR4iBSU2D+SRK/IS9OEAcTstoxM+ulsMiEcRi3CjxMHtK04jIZrdajmQn91fmlonb7Znxz2V5DM7zTRmbzvVcVe09nVju2Y1ISn6Axw4dVfZns1VbnQgseAvjwu0wK6Ryfs0anxrdOTpg+7LtvRfS2lEycAigIT/TWWyX5T/gBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707934600; c=relaxed/simple;
	bh=eNeI8ldeOXVyYU5y4G5uGvLkA49GeutfdVfIPxaJR+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M8b+8NXqj+SMzGbDWlIpmgX0QXkvzCMZUKh8Viza4Z+btJhtOR9CO7BpNw31pi3sfL5ZXprIWIXlBzYRVIxYgsAV0yoWkEmkHJ11l9YYIMAmwXX+/ymkSDgMYflfoNzq4Dfn8cVHXePi+22qUI1GTrcmSg/n5SXEDfTbcRou+xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E26Chg3U; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E26Chg3U"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3394b892691so39877f8f.1
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Feb 2024 10:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707934595; x=1708539395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNeI8ldeOXVyYU5y4G5uGvLkA49GeutfdVfIPxaJR+U=;
        b=E26Chg3U0CNugwEWF8znDaduqL0fDV1hUDctrCR3+VvX1qq07Nou1zn5fPr2rIPV2x
         DV/RgvN3wsaJFRTD/ZoC4gz+ICpaWgy4l9QrDz2bmzTa5CW99BhT4XqTcMeFm09Y/fB0
         Wd3/T5nR2ticg7tyQB0YPOIxgE5UXwWpbJtqjV2G7xH0kmm8ixctu4atrj0Hv3O3Kqyc
         MCZq6XrXhcnH0QPRu8/DUW8/RVz0Wxyr5sby26zi3GIk1o/lrFQTxGG14hXg+bh01nRq
         PYCjBDZQZsW83tD1HZjM2ala4adb4jB/J1N7HPO1PrqlgkNsYY3QsfuvNNnc+kA5ck9V
         5mkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707934595; x=1708539395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNeI8ldeOXVyYU5y4G5uGvLkA49GeutfdVfIPxaJR+U=;
        b=JFGx/pcuqyjHrPrt9jKptTzxwVUOESrqs4xkiqXkbrDVIR4CU8lp7Mna7fgJxA4qS/
         vXRf0qgq5Jx+lCaM+CrJXsiJQep2p9icq35Tq38FNSoslrpaEEaCyZl0qbeWRZ4GceDq
         R1KK19CfT1k6uA70OTCc4Og4GpJydGqPVMueliPre0IPStrwZZqnbZPP5794PranCk0Q
         1ka6a7JcIAzjo0M09YQn7dkmbgLlj7pfA86Zn6H8mhI9m86YFGvTedzYUlIc1frQmpGw
         X4R591faYO3vj6NCFPh0GtB0R1tYFprbd3dQ9PfOlbEZ7PxGVA90xYc7YHfxmigoBIDo
         oomg==
X-Forwarded-Encrypted: i=1; AJvYcCVWpEOAN7zKPQhsB+VoNbEUk9PRzDR44NfcZwTMyXeT79EnFg8z/GIZRlATyCvsR1VJ5DfhtOOHv3fkI3M2X0BH35kpCgfdsufaqNM=
X-Gm-Message-State: AOJu0YzFvFw2wUPfZ0WZIfo5XF1aCnrn6jUTcY3JMbx82vo4qnQu5j+C
	D74/FZLVeiLXKbTs35yiphslVQrYQ92OrX0LiDuA1U2Bkp1F9dgq
X-Google-Smtp-Source: AGHT+IHNgm4mA4NeVwoXy2ia8eMk3+9YX7+zGJaL84z5AExtp64tdZok98OjS2DaHI8OFZo2AYSpbA==
X-Received: by 2002:a5d:40c8:0:b0:33c:ef57:ef02 with SMTP id b8-20020a5d40c8000000b0033cef57ef02mr2504331wrq.17.1707934595160;
        Wed, 14 Feb 2024 10:16:35 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id k3-20020a05600c0b4300b00410b0ce91b1sm2610954wmr.25.2024.02.14.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 10:16:22 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-pwm@vger.kernel.org,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject:
 Re: [PATCH v6 124/164] pwm: sun4i: Make use of pwmchip_parent() accessor
Date: Wed, 14 Feb 2024 19:16:19 +0100
Message-ID: <2717935.mvXUDI8C0e@jernej-laptop>
In-Reply-To:
 <3ddaec73f3abefb45625d0a469026fa8d13da8c0.1707900770.git.u.kleine-koenig@pengutronix.de>
References:
 <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <3ddaec73f3abefb45625d0a469026fa8d13da8c0.1707900770.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 14. februar 2024 ob 10:32:51 CET je Uwe Kleine-K=F6nig napisal(a=
):
> struct pwm_chip::dev is about to change. To not have to touch this
> driver in the same commit as struct pwm_chip::dev, use the accessor
> function provided for exactly this purpose.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


