Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2A52F1FF5
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 17:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255893; cv=none; b=LOHRzdxhvZfmrzFycARHAA+ypFUnEEhASy0L20iE+56yJpSX+hlmxxPtHBC3Zw4XbCPIyfVyzbzEajzLuIjOHJFBg3WTAcaTeXZ/9rG8P6EMXonbHfFXoAC25/Q/5+qJlletaMeGniSVgNb/VgzFO3vQz2hT8M09fiTXMdW+J08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255893; c=relaxed/simple;
	bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/Nhx8Ze4qjp9vtgZ0xGAQ1UYszeQorhE2L9+MaWjIKevsY6vDJ0wETsufh6+j7gx+DdtsjVGcZH9X6s25OtRxq70Hix7v/BDD9dWv3nsEoK6RC3c7Leq/ocZ0GuOFooLshyfEJtA4pSmjErmBpZT8Ah8zCoe5JkCWF3iKDrGr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZmlJqgCi; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZmlJqgCi"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso20235531fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752255889; x=1752860689; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=ZmlJqgCiOeV4wcvG7HayFmQKcrOVuqzb84wxA055LciQjwqRXasYyuDuAhP0c2VplX
         G69DKZnXbhVJpJIAGSq0GGvGq8bC7PTUZvhekhk+cKz5oYQFItjoFNVs17tBU3K+Iud4
         FEK7UKH2Mgllv3/mTcrvDmTOxqO3EYASuDdUTomd9dMyYj27EptODn5gNEJaXQKefhQP
         QFU95YggZW9LoLUIDR3jMg8vRvJRMXruNnadwT8ih3bmeNIB1AoQ1Iie05hSY439qxA5
         qC9cZEIWMZFCwfuYk+SBcopbxky+KBI1TD9glb6ulFuTMP9qdAsPtNTEBZ391/BvP4Ai
         P9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255889; x=1752860689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=iL0sMPpronJe2TDXt/7Dp1MIA0M1cUKdq4wV+DiZYB6l5fGCDaBZQICSG579U1QKOb
         ynKOPsXwwEtYVCrFcVlltt46Z+GSxYWID4WOwA+aK45GisKHTJS9AnzudwofVK7Iudok
         Lr5RS9MD6PbYO/QtdEmo7jw0nhxfxYPXom25Ufqfn74MVMJmXZlmYe8dwLCYvDoDSV7V
         z575XShuNmqRyoUkhcvjy1N7ckM5buCx3v8vV9ck9mgiVK1hgk980Zv4DS6KC0NeKStC
         3LOm0JFmSlD2Po7w0AnztFsZhSvq2u35Evcj0TemLSTlYcvZ0csrrXtskqRspCiuvzqn
         BfVg==
X-Forwarded-Encrypted: i=1; AJvYcCXYFYSRVG+LKbRccfZA5rhcET0CihNgo9iXZGZ+0HDr87x0eLYq+iiU4MLLBJ5VWD5AksIT4M7cCx2cnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkU14QoktNzanM3up0nerHR9g9E6CLwcior9nilTNPvd5maFGW
	pOXU028VKtNn2aRJ0++xZN+fnmrVMk/8W6acSqH0aNEtn4iAh7YUP+Vmzk8aJLnOgMmmLSYZDDB
	SKdde3fuK83HeBjO99hZcNfnbU/9tpRLylTY4r/Hq0A==
X-Gm-Gg: ASbGncsnWsznZ8kUvB7F0wz94Pq04HNU404PVyLbQbZXUcBBZ0qP1C0vaakbHKTejWN
	Ukwi/Igg+LHpcaFJoAvg7Y8J+FMyHvXLgIwAcrku8tOgN0itxTOHPRs0l+2n5OryXFJfck1Zkc+
	OBcrn2Q4T1kr1jsiAoQ0ANDZxH3MLeDVdrK+WjGpslMKg1N+IdTPUDBzyb9hF1FmGaOuJCLDDSX
	NCgwA4=
X-Google-Smtp-Source: AGHT+IH6ZOzBfHIgYUwgOc3NHyt2gji+Em8NzLEp8xFU4pLvltizLDn2SrTtw5BwtYgzrpRFDHd1anYmDStmm3/BYxA=
X-Received: by 2002:a2e:ae05:0:b0:32b:75f0:cfa4 with SMTP id
 38308e7fff4ca-3305343ffbdmr14799021fa.25.1752255889239; Fri, 11 Jul 2025
 10:44:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com> <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:44:38 +0200
X-Gm-Features: Ac12FXxUNTUQvVOGg3MoOkpShRe7WywXW6kbpP4WvN3P-CcJwwv5gR7MoObTWCg
Message-ID: <CACRpkda3R+2hhzvd+snkTGrRb-gZ8OUvzAhFE5Cg6yXfZ+E4nQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/pl111: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 7:43=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
