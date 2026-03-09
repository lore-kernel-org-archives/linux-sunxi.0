Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD7C41C2E0
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Mar 2026 17:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079068; cv=none; b=SCBnmD6laWgW0pphu5rcXFgAH/ox7mpsh4U/pl2kSGv+FMySRUnWjF7xUI7k5DQ3usaQNqcfy4Yv98xojgKKoy/Yns59FVSRwmqNPouPcXfyNBD+jCjHHg459sw7NVzDvqw9hkCqGFXG9Zdtc18ldiArTjqQj67DmCeXESzh+Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079068; c=relaxed/simple;
	bh=nUKSwJnAjG3KEbJmiO+Wt70o4b5Vf+pCbPEIwqMHXPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ceXZcVgQIiTHxeiZpoDT0zCSHUrHA3kpt3eB1P+q6XF2b0LXV/12o+ow0zGeUyFOF+aQi+Kvec7ABFngptlO1p5UhR3Su2vS/cuqA/Lx1T8eDztuJ/qj7FfnaeiuJiWND9cXV6oniw8csGSWm5VfxfJtVimKq+ao9W8dXLCibxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEROZQpV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEROZQpV"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439c5b40f60so4936823f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 10:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773079061; x=1773683861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUKSwJnAjG3KEbJmiO+Wt70o4b5Vf+pCbPEIwqMHXPE=;
        b=AEROZQpVSsIaJUXQsU6R99WGtACAnM0td0G+LX6WRVhUvzO/Q36LnVcmnqpENaJKOZ
         7UDe7EhbRvjEiNlq8ktfoievISOPcGJuw7iOdeP1vrSRK3YT5DE/kcmMYWx26AZpRgiP
         2R5983eOUfmEDj51y+z8yg6mKFYDbL5Odi3LLlMNUJMBafvelikjdC0thSUCHke2gVwH
         qUIHcrOFtNw003R1rI8RyKVrptB/EXbliODqwLBdU8VP12YHEr12Gfk+440SzyqxZ0hN
         QHnqlxn4CnnBk005mz2ktMC1Jt140lCahlG+/Qo/Fm7ohtCUgqOQPyGnW5FzJgsgPYBI
         HVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079061; x=1773683861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nUKSwJnAjG3KEbJmiO+Wt70o4b5Vf+pCbPEIwqMHXPE=;
        b=UU2zCttE93ccSLTkPsftZmSq/8pUAtYMUSqs4n3C8H4rrwpnXTjx0JNQXxoTC6taHp
         nhBQX8njsPXxxG3v0X+fhOh3RN7eXq+uGZQm39m24Ic7sV+E6dtdNrvtnf/gsw5i4DST
         BckW43HZyO4Fam5ZIbF8a4C4mCy8gpaF7gD1N8pKdIAX84YcdqCauFcljzf72fZo0+e6
         LLJV+M28Ybd0pw3/omKK8tv2qSmo2VN9gh7MVB/jdXlwiSeofAEzndmIpMZb445gXdpu
         t7Oxl8vP26N5Oslh01BMqEvYQpPukmd9nPDzWE81OmtEIkEKxr0CuYz37WXQIuNzqh3l
         nngg==
X-Forwarded-Encrypted: i=1; AJvYcCVsQsxax9DYgMgAorweiIosm1gDKIz7H+/iUCbEvk11IjeUynCAKPVNKRsB0i1cSLQqgmCUSIl2OH0T1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfEViwOZ7Hb5ZNt+hjJcA8FBu2brCJHjykeY12A4OYbBM+d4Hj
	mvdzVogAwSfvZxBdgdAzjlW5dwmWU8q9Jpghy1rfRVl7CMiSi5ZSkXDo
X-Gm-Gg: ATEYQzxjkYYXi30W00T5vsaOGQ9nAkq1ZulEBerLEVmasHXVw8Ijv/tFo9rlBnToG9I
	YmHfqiEtk0VjJHadjx+qowuN2J30wmBY1Zs/c+bbCtVXrv71TF/Jrkluvi9sxsGUv3cPsO6jt61
	ZsYXG1EYACsTdrStQCmuHBgO5iPkYDkMXAMzhsWRaVdTUCQIiGUz+yAez40gKRMb+PeL41EJWg0
	FwIq+X1wXlZugrMHhtgcFYHN+cAJbmGjB5S8z142e5xJreK280iV5OjSSKE4l4CInmmhRlaVFLt
	2M+HP0dBIPAJIse0XSOAiH4LNzjj7AwKvw8wZ9p3jtFshr/XhYemeyfQzpNWGsmUnmSSm5Heu8N
	Dkk5evrwKsPZii+LMu328WJFw+XNId/D9t73W5NJ7/TKHpwWoEV2REfE17qtmxF+tLd+tJ3TCN4
	S2FqY1KUQZgVD5nO9pvIQgvmImJAg2M/aqcxcTBIKbiBHhe7J5XwToROZn1VZo9PN58rxDJ9WZc
	3fDeQ==
X-Received: by 2002:a05:6000:2506:b0:439:aef4:944b with SMTP id ffacd0b85a97d-439da351a36mr19860816f8f.19.1773079060736;
        Mon, 09 Mar 2026 10:57:40 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-12-163.dynamic.telemach.net. [86.58.12.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97da3sm31230324f8f.12.2026.03.09.10.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 10:57:40 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display
 memory
Date: Mon, 09 Mar 2026 18:57:39 +0100
Message-ID: <2820486.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260309165635.1138413-1-wens@kernel.org>
References: <20260309165635.1138413-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 9. marec 2026 ob 17:56:33 Srednjeevropski standardni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> Commit 4636ce93d5b2 ("drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()")
> adds a new helper, which covers fetching a drm_framebuffer's GEM object
> and calculating the buffer address for a given plane.
>=20
> This patch uses this helper to replace our own open coded version of the
> same function.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Nice!

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


