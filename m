Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F973D813A
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Mar 2026 15:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330195; cv=none; b=Gnfnod+BQMOGW7LO/1mySQbZ36cr63a7dpz4RAm1aeZtBHvyEyRlFXRAxYkcZVwEMzMk8VMtS3818G24EUiWT5p/2AiUYDuLvVCYRawghxdUw7+N5Zb0UZB4B0xM87h6D4IH3iuihBSzQ8a/YTKq/pVTmXSzrqJQ+/YBGdMHafs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330195; c=relaxed/simple;
	bh=eom7nlu7axkZ9mgbXCO9vdbgaolQc0NMcO8zuNAgtYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgWbjifd/0qvkpT4DkLhkHweCU4mUV84l83KRjtjeevfSuZr5WQ3+KjGZBN0P8EiK/cTAk+s+Rs5uhAePmDHM+4cLjuiLdYV+BSKBMH3MYq4dc7WkGcrAp0DudXFg21UOl/J1txUT+cbIk2yv/uJREAX5MWYraZcPw3pJjbMmvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKAKjkgK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKAKjkgK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439c944bb62so948997f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Mar 2026 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773330190; x=1773934990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0FWnXZcfmBjSJmvownu5+w9xLPXUji+K3un2IYyipc=;
        b=cKAKjkgK/UoyUri6+7iEeA7qPYX53TwEsBe/fjDA90UyQzRflVw6G7Vdf++e2/FXyk
         Wv97cUhuFFqsjTQTOAZpxeHx0Aqkd3hOObhZli757UpnMiLnfHUn1i8wW5GCLWomx9Sc
         jIdicSbO2ugftsBK9Ckmfuql6JSZHeyzDlu1jgDpzNw6EMtiGp7z1QdcC76jjub4FibW
         hmUVMMEBPrYHS6ZQmIn6gQFdOFViFs4NdEd8avi+EPa2oiLRL6CWWtAb/atgBS8u1WS7
         BwN7rGqJ1QdDJJWDgk0s8bHn518PUrcILNivVaE2apRMQKycDlmt8H5Yg+ZlSibKpu3X
         FXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330190; x=1773934990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0FWnXZcfmBjSJmvownu5+w9xLPXUji+K3un2IYyipc=;
        b=dbHCWgHbRbo1/RsWeZBqFiWbKy3aOdwx0OJREZPGiXRu0KRBdyNGMIdZCBsluNUA88
         WIKOm2uirFmUhi5rW+GDNcstKIem8cY54H2kn4qjb8L7p7K7VpxZ0PyMB5BBNJSaOtD8
         DclNF+VoNwd5yqeYo1pPNxnFeYJjBQhNHu7+12wXCBXluqeH5BgwtIxF+W3El+9ZGARL
         AeKWO3LRxH7X3wDmmmmSVKpuQWfZ/VLPWHorgmv11LC6wsbjwDsHRzEk/z1rTyZ4ZLD4
         m4UdiYoFeDgLovPPXEti97g714do27Swgq0IplNZa3JQDC4INAush+SHs8WnF0xKy9dL
         +ChA==
X-Forwarded-Encrypted: i=1; AJvYcCXPksKtg1Fx3mN3tNhiXrUgfKd9WaL8sM7C9hLf/3nnIjVEhwNfFvHd4hAY6uLMUAQq0O6SYr/T1IYWZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSd9AqXDSqAcOjzmORawpCx460HFMRcjdMQnuNSq24eythFAlP
	6ltRVoeDdM7dzx8DjW1bIaYPQ1+t0spUTGCVaattzOz1dkVbUaiTZ6k8
X-Gm-Gg: ATEYQzye3QAsz2MmohOGGBy8AcWzd4Y7oQt5wBK2F19EfNL9Lh712aHgror5nRJIozj
	j1lg3fHXmQGGbeyUmJg30gyVJBT1H1EQb2ZqEZwoNjEV4KB/E6bsPghUdUB1a/EN2KmP8QmiT6c
	YCHkcjq73VQP5Yelkioq8yYZyweAH2I4XjC/ZMa31yQwuXk/rsS7E6q83fjCxY61Cdw663fENOb
	DFHWI54SiBf1+O5ZOAe5FeB+v/KFbeHIuUwax4GHeMHhg3BBtZ1lnWtyEjBbqA/+5M1IRsgxmfS
	bJEvxcYUtr7Fv2Ck6Z2lPcjIePyTJ/a5LUEc1NrGC38cMvtrZi1m+B0nqsygM3ehLseAtZa06nB
	6OfyPAV9oY+fcsCF6o2LCn/UqXuvH8e48+EkkLJrjxJ1/Gs6mLpycly7w+Ur8mfnCZ9jLPMNzQU
	lIxkCIek0lkss8Ycm+Pt8vjE3Ro+VIYifQanQYTmAabEeAcATk0jQF4USqY5v36Nxbj/3EM6SI8
	nfEPQ==
X-Received: by 2002:a5d:5e01:0:b0:439:be67:a034 with SMTP id ffacd0b85a97d-43a04dc0c3fmr244402f8f.47.1773330189741;
        Thu, 12 Mar 2026 08:43:09 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-12-163.dynamic.telemach.net. [86.58.12.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm2132231f8f.36.2026.03.12.08.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:43:09 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-sunxi@lists.linux.dev,
 Paul Kocialkowski <paulk@sys-base.io>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 4/4] drm/sun4i: Use backend/mixer as dedicated DMA device
Date: Thu, 12 Mar 2026 16:43:07 +0100
Message-ID: <2820906.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260311094929.3393338-5-wenst@chromium.org>
References:
 <20260311094929.3393338-1-wenst@chromium.org>
 <20260311094929.3393338-5-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 11. marec 2026 ob 10:49:28 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> The sun4i DRM driver deals with DMA constraints in a peculiar way.
> Instead of using the actual DMA device in various helpers, it justs
> reconfigures the DMA constraints of the virtual display device using
> the DMA device's device tree node by calling of_dma_configure().
>=20
> Turns out of_dma_configure() should only be called from bus code.
> Lately this also triggers a big warning through of_iommu_configure()
> and ultimately __iommu_probe_device():
>=20
>     late IOMMU probe at driver bind, something fishy here!
>=20
> Now that the GEM DMA helpers have proper support for allocating
> and mapping buffers with a dedicated DMA device, switch over to
> it as the proper solution.
>=20
> The mixer change was tested on a Pine H64 model B. The backend change
> was only compile tested. Though I don't expect any issues, help testing
> on an older device would be appreciated.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks for fixing this!

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


