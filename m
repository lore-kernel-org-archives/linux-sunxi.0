Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE09126F3E
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Feb 2024 18:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707934981; cv=none; b=REeCwZef1IfeEbPj8LgUmcrpz+AiSZictBJWrptGnuLAnPbdQ5U9a4fn0VUdm56mcSTwCq2+rMBuMDjqWy3zuiUcIWZyzzbeni1I/yEqicpVcjuN4rTheh760IUwZRRXe/CQQ5J35xm2y+9+Qa8cKUOjtEzoqlUrow3ceC0ou6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707934981; c=relaxed/simple;
	bh=wLwB1DtHP8MzYVD+m1v4a7qcHJ8TBKOoV1Wgn4+sRSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I/rLPhl1Bjg6+wWFX+gwfMuZTHp5XSbPiecqlkoxQUAaiGgTHjMtWfgHCpKLJl/wESWHE5uDCmnhr/GzpZE8xJ4JkjRfBoG+03dNVpcL13PzElVeH0cbHgTWvS62ZEzMk7Sfkm1nC9g9dNf3FMgallQscYVkFg+gLUUeC/IdUOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJCs4nSq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJCs4nSq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33b29b5ea96so44349f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Feb 2024 10:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707934977; x=1708539777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLwB1DtHP8MzYVD+m1v4a7qcHJ8TBKOoV1Wgn4+sRSU=;
        b=eJCs4nSqcimQLxwC86BQ6bZAxKpD+mGllbyNmxiRjYqZvbaaj+msP9lgvWvGn+nRay
         5IHHfQf7frvnY+SR6NClU+r9F6rE2StKhGgb+VRTUJc9Dbp0uH6zDJ6K8nS8cpt2YVCl
         ho3o2nSCMA3lE08QxUOHM9cpYrGQirEQcCVgbfalYjFhoU8o4HdbxQc8kqQqIe6P05Vn
         4iLSE46YKgeo3xT76OJ7mhdizcNuAWQafluaSJ1Jq+sq8qAgkQg8ELFUAK2rFXLPjiAh
         2YmEk9gb5dHo/L08CtUWQsSZwWwBhvDmcbnXALnGtdnwphKApqVSYZueNE3iORLH36/G
         Srhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707934977; x=1708539777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLwB1DtHP8MzYVD+m1v4a7qcHJ8TBKOoV1Wgn4+sRSU=;
        b=HG0GL/zgEzNV+Hw60MILbR9W8Y1K5tltWl32w4Ld9i7h9dhQYnIBV6NBUbKxH7oDru
         +dQLZ1nSCOr9M2vK2o+RfcNFkKqUNd9qZ+M7aKTscZmL7eHbei8iTk4y1Kh/WIeu67sC
         w4m59B5wcSdMrUcOTEo/SVYPx41T4rjiZhixpq5ZI8z1KQQXx/7E/C1DVxLrEP6s4Ebn
         2kUpsWUATGWOEyXfkpH42SbL3LrTLIXrVkCZ1RrHFil/RXe9QtYFXzX4ZkvMpYVb+pSX
         dDySEf6v+60NJBO+1urB+QLPieAK1XFGLpDxz2Nwu0gRIcGu/DyuPQqxSzOGzS/Gc7Xe
         m/yw==
X-Forwarded-Encrypted: i=1; AJvYcCUbQLoJuCU7R+YjqMx9iHs3hJHZMIhVfKsGyAoex6bHybaT+QcYZh3kl69xdy/9kr0UuidkPFdICfUDvo0npUbAkLzNOBHPPgRMA5M=
X-Gm-Message-State: AOJu0YycpQgr5J0qgOcHGbLNV8eSKx9ftrWevdNNGNgVXnzwFY2uVfRi
	0nx0xdejJpBBx54mt3RdCY4NQ4Kd8wY58DgM54+3SyfWyrD5cmIP
X-Google-Smtp-Source: AGHT+IHrGEjG3eJNNGdzkmqYrUba9T0D+o3uMWJcg+7AZomwpfnK0bX1kgKkAatwJCs5+CB4YpXvQQ==
X-Received: by 2002:a5d:5245:0:b0:33c:eca4:653 with SMTP id k5-20020a5d5245000000b0033ceca40653mr2207763wrc.34.1707934976312;
        Wed, 14 Feb 2024 10:22:56 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id q25-20020a7bce99000000b00411e1574f7fsm2600537wmj.44.2024.02.14.10.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 10:22:55 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-pwm@vger.kernel.org,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject:
 Re: [PATCH v6 127/164] pwm: sun4i: Make use of devm_pwmchip_alloc() function
Date: Wed, 14 Feb 2024 19:22:53 +0100
Message-ID: <4868529.GXAFRqVoOG@jernej-laptop>
In-Reply-To:
 <9d175b4e27878618cef2e75b6ecbf01ad5d18164.1707900770.git.u.kleine-koenig@pengutronix.de>
References:
 <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <9d175b4e27878618cef2e75b6ecbf01ad5d18164.1707900770.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 14. februar 2024 ob 10:32:54 CET je Uwe Kleine-K=F6nig napisal(a=
):
> This prepares the pwm-sun4i driver to further changes of the pwm core
> outlined in the commit introducing devm_pwmchip_alloc(). There is no
> intended semantical change and the driver should behave as before.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


