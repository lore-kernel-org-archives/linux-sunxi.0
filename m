Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE6E318139
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Jun 2026 06:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542211; cv=none; b=YUZdu2j9A+vGQbeNt10s+xPmIQa4Zd3eo+d6m2p8DuHo47TeBWPaRM3z7nHYM99awqqrTlJvb5SJE77PK0tbd9F4ditS+I5omNodWj2fZNipG+SYoFfbZuAflH0OIdZLWX5AsuNeBb6P6QRed9GM2n+IstZvdPtmwajk22PqO1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542211; c=relaxed/simple;
	bh=komZ01FtP3txsJGXgsSmR1HKfwi3kLT906a58S6194k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k64exKDTz3+/VULt48SKRnG989zmi4TIAlQn2qfTcE6FHaTEcQNo0Mqqq7eKWksa22kWHcFFCl4/3uZGgK+4zMojDcTSRwJ3j/XGfag5Gl6XDTqVWY08AghS+zOEPs5upu5/vXKZR92rSDBJDSGxDy7GoxAb+K1rhEB8KgC3eRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HALOX+wW; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HALOX+wW"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-46cbe01d4b6so901809f8f.2
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Jun 2026 23:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782542207; x=1783147007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=komZ01FtP3txsJGXgsSmR1HKfwi3kLT906a58S6194k=;
        b=HALOX+wWNMDMrXDwZXuw8h0GVcASvv5iD/ix0jJkAjMjpe/0Jcpa07o5vmOLHmWj5S
         IOvC/ieNrWsWobV8xUyZb8uyGzKpy233mEqWN2J/vUwrUD3BaZ25l7nm0pcDPPty5HjB
         NGdF1KQWu8Il8dqDtnKeInr9hHm0DoLRoHNNTjI5uYpIht0m9Mp26PCmdx+rOBxFc1gT
         kmClSVWMF/Qswk5mFbKiBa72uJi3pCqACji9cqxzj5A1S8yjFvzbPdZCIFeycne8LSaW
         lypy8xyk+3fmmKkC5hD1WWebE7vlFETGvEYWgo+q0Hl21AV6qHl8OY4JxWE14O01yF7k
         GxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542207; x=1783147007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=komZ01FtP3txsJGXgsSmR1HKfwi3kLT906a58S6194k=;
        b=SERzRWVA+AzXLOozmUH4URuJ1O0dgapT0UpMpmgkvEEmjV/yKpZse8i+21BM0TKV4t
         CCxUTQgoj+Sl3QBxsHzwH43qfcCuNVMk89jrSirg2jXGe3Ta1PqeZfaSzWRPXBKydf2G
         NPAQzABxw1J+fJnszMLFbTfScyJYAo7Cu8XjLHTWmJnLbjZgAjUWk3m8UaId0x+KV7sr
         SRmYpkK8xLCf9zippqVt0JRcd2KTorPvlLAucshcO2OvBMJVTjXlPeC5fkBSGOwL5B+p
         39dajGw3nAdBLQiNvEMYP3R6jDs6d8VvGtjWnzQOjY5tXUoVaULyDDIiikr2ct8k+H8D
         UcGA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9C0/2tziVjt/ld3PeJ3JQGW73LaAX2/UsHJKodbbvZZsfbbW8Lq9Q9HobNRh05uRyOxgMQrecLvUx3g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq7OjeMZPXSPcvuTkIfZYRO68ek+lTKPeOv2RePGcXrxf63OVk
	HzFVEFL2Tt0xckwJ+suCWL9Gv3A7w9P1WTqj5HYvJcbqRD7dXW19RD7d
X-Gm-Gg: AfdE7cnp37F9Vrb5rvN5/JBYM44FmFztGuiZ1BlKqNW4XKBPyUfeurYpxqW3/7KaXxw
	K5FjPcUKBj1ydDuYQR59kioBLCnpPuFyBjGfKZU7EutLIEI1c0QSIdD4vHyoySgEAx0upTWZYDN
	szYIxlJ4+iO0eFxt9MFMuiwrv8CDds/son/DO4VYIqxuf+/TQfSHHNb+mclTvwxMemnybSZn5tX
	kcF0ikSuRwN2gcxMe99pm/Ntx6yRyRAzzOJ6Mwe1IjpqKs8xTWcmyoA2wZBXOFbEopu4s79hA5V
	UdNxyxQlDIEN0Ss0JXeIKkPkNYaJCk9JoU85WhESYMs8b/hOFfyN/iC+I1GbQSLRo99aHoEaBFh
	eKmwFKT98gz9T5PyxlYKK5cZlNQXaY7vcmkG3KpZcLxfmgKpNjWX8oKmsjLL3I69iYLhw+ReTmT
	yvoTkJkGXme7eDpBsqIFwQcfF/Shn4tFlL4wBSk/1uMw8JOhhkOEiVbDlfAOJbFdzYhPIKHBBJc
	Cjf
X-Received: by 2002:a05:6000:71e:b0:46d:71b0:e754 with SMTP id ffacd0b85a97d-46dc30ddc52mr14625249f8f.41.1782542206978;
        Fri, 26 Jun 2026 23:36:46 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46fe25429d5sm6986765f8f.7.2026.06.26.23.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:36:46 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] drm/sun4i: mixer: Check clock enable failures
Date: Sat, 27 Jun 2026 08:36:44 +0200
Message-ID: <H-eSPH2FSEq_Vc39E72MsA@gmail.com>
In-Reply-To: <20260624055123.26769-1-pengpeng@iscas.ac.cn>
References: <20260624055123.26769-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 24. junij 2026 ob 07:51:23 Srednjeevropski poletni =C4=8Das je P=
engpeng Hou napisal(a):
> sun8i_mixer_bind() acquires the required bus and module clocks, but
> ignores clk_prepare_enable() failures before adding the mixer engine to
> the DRM pipeline.
>=20
> Check both clock enable operations and use the existing unwind labels
> when a required clock cannot be enabled.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


