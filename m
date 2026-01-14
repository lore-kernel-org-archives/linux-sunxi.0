Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CA12D372D
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jan 2026 14:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400152; cv=none; b=j7fklhiScugmwK+CWGrswIWzkOcu8Sxs4sLHlKxmw7+iL01zlzgshaME+lWVawF7bIkoxeyaaqgwd1OXBqe2/GyHyrLs11/Lq1GBVqjsHy5TpnSC3VqwHptasaIigHioMDU9mzERI1gf7RqCdKupbPkT+2RnNF2xUtQkXNCwd5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400152; c=relaxed/simple;
	bh=J+57xXVtj6zuivobD7Zh7jLdMWRbWf6MgQp0S0DWT7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amhh+XFX02+JmJl1FRIxw3Mm+TxM2q9qWvWEA/XkLTiZvLNy7XQrp04+atLlf844EwGnsJ7fBOA7V5KFaU3yS6Zng+3t7T2mpyYiPEf0i/48DZJMKKcxwuPxBhOWsvjSMRBRk5br52TzEUmYMdijbx0/n2Kic1gYTfWdReCm9dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FVJ8mjf6; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FVJ8mjf6"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b7b27ebf2so5590819e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Jan 2026 06:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768400149; x=1769004949; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hjPkkzMohS45ECF+5/vRW6fDsFf40jPRuoL50s4x7Q=;
        b=FVJ8mjf6z0MT3W/fHwUcuKqaYRgONBV6laDtEND4qPdMyY3O6m4YX5EztEoKbsDAzG
         6D1/Cwx9DKe7XS80JYA03Q1cmhVTI5u7J+ICH4WQo0nztGpB2xCm9UPKgOJmJO7DMAVv
         0Wngj6soCpeo8kupVqWpdWAUTrfPkHDiuQMdn929UcxTQhK2zgmkfkxes9t4g4XVM7rx
         0g9TQZflHs5LYL3jnsm4ZhGgLCmxXpAG9RpIvFp8yhpaPxdEPCYkRDcwwvAz3L00gSon
         Q+7Yq+e4BI2qaPM2STm0esnh1drVB+GsEl4Ec+5RDajF6Pwv9fZwseOQBGWk/vlNmUKc
         Yg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400149; x=1769004949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5hjPkkzMohS45ECF+5/vRW6fDsFf40jPRuoL50s4x7Q=;
        b=dWvKfmoVmszzzX207s+b5ED26KvGKrJqQ/GQtVW6cOJaTTVE4Q+gXcdz5IeAfpwIra
         XinRKErLmBsh1pcsCF/RfkfmZX5adnNsMnyChuunNmrCdBIoJJzyc+wQrL19RBGOpS8i
         luchmf8nnf/A3DWuZ+hhzehihtT3gPG1ZzI2cmqY9+82nX0VS9pxpZY3uJflycG3KoqH
         Yw4ATr8/ze+i+UoWdIf+s3LOgDop47GaTa1wGPuXbg6OWmnon3dSFciJ7syS+U/mAAX1
         ZiFAE6Z/4QA8AKmyWDPeAR/lrLKvYkYQr8OT1gpQkwbJgqeGd0Qqgvoo9GXgjom/jSaN
         GOtg==
X-Forwarded-Encrypted: i=1; AJvYcCU/sJPniQFIp5fOsOZdVVxZlMpPTYtsYFLc13EBSRRCN7by50J3sqM0/GWdcoIvIB/TIKe4PnMZQITqQw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0cYHtqB8uLPZdVWGKRoITHpbiWk+9nxXDCD0Cqhetd1urwl7E
	E4RRwIz7/6a+/kvc6OWq+Pfmb4pCN2wjhmT3fe3+wXm5K/FixBsGMIewy8v7EWmRd0Pwb1PecoL
	MshDoeWOdEySDEOjBsenZ/2sD+7hv6aAh/3618OewTd3pkB5yvwHy
X-Gm-Gg: AY/fxX4VVlLuRFJFoMUmE6zMp6lrOsDSx8mLIyublCtzWF0RnR0jjgBFOFVvAhQvx4G
	HY8e71GyeotGHAmpXjaYdrSuU1LOCLqU40B/fB375wczBU+aDK7DToRUZ8XDBMWmYmBIlzgdpPv
	oFSk31ZKeje1NdtXUNoRI9YBd07sT9cUYgEowMfwoEhvKASSwBzcetZYITG4uLeWIaeCDcXatUt
	+DuEz1YxJmF2CEo1li88ggEGPpxWkwVSJkH9MDDMs6v6EeHruxhY7EPwXk6qAk3HTiFcDKAvKdf
	njbz5x2Wyo6I2uJB2fNRg3s/gqPZ
X-Received: by 2002:a05:6512:3401:b0:59b:794e:dfed with SMTP id
 2adb3069b0e04-59ba0f813d9mr955411e87.25.1768400149484; Wed, 14 Jan 2026
 06:15:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251105152023.259813-1-marco.crivellari@suse.com> <176839928954.937923.15095865192573263958.b4-ty@kernel.org>
In-Reply-To: <176839928954.937923.15095865192573263958.b4-ty@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 14 Jan 2026 15:15:36 +0100
X-Gm-Features: AZwV_Qgj3UUsI_qnNsOnW1eSo8sD6BvrOvfDzZ-kVDXYnmGSUkrSa02nUWpKX50
Message-ID: <CAAofZF6n_BVQhoPGOc+BeKgBr8YncgKzkLrRQKDrZHO0EtUpug@mail.gmail.com>
Subject: Re: [PATCH] phy: sun4i-usb: replace use of system_wq with system_percpu_wq
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Chen-Yu Tsai <wens@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 3:01=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> [...]
> Applied, thanks!
>
> [1/1] phy: sun4i-usb: replace use of system_wq with system_percpu_wq
>       commit: 877686f9f42b58b04e4e25d07034bc95cadc20f3

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer
