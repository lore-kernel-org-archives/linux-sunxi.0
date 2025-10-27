Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BC0313545
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 16:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761584365; cv=none; b=usSiRAQ+0lKDwfkQdthbV1ZYoxQaTyozlpghZDcGM8/VMs0XApin1Quhu3aQksSvi9V8rWVZJ/JYE8JTjWiuTRq+t5NC/jLpWuZTeAVopKyIJcoH4i3HJt7S0Q+wwyuetxEyspoQoqyc4ftbx514uzSpxkpI242SvWqR8FavYxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761584365; c=relaxed/simple;
	bh=iyqxH4hxbPgxvQElXkdgiIeZ0ywNFegx6MYkB5gAcoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5dukAe2e1jg1Mhi4hKKaKeePKGUa/WzLqVxpvaj63+QQxAcO0x6a/7DKcTwgJOeEgqzwrSVNnbdxozBLnnamWT5WkLhp+cBCMH/6ZX6aXlFRIprROuMBQPoEKtQ2HQ4se9Lc0dEAfn2RSdkLYp7WVnfTdFo4pQ3kT8hY75u70A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37775ed97daso59401471fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 09:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761584358; x=1762189158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iyqxH4hxbPgxvQElXkdgiIeZ0ywNFegx6MYkB5gAcoA=;
        b=LWj1uhT0j7grjYblLAkSFfoTGXr/LZNIIA3A9ZipmWt9MSRn8VAgzQHtXMo5vX8c9b
         GHuvEWJlG5p1p83VAIMfS/weOU26UASGsst4xml/QoeHk0XH02ydGlwOD9C2tCn539tw
         p2IooTTSauYCj13sxstvoXt2opxfMVtEQCKaR7F5Tb2iQ8ml3U3s985ZA7unUkWUcWmX
         gr1QWSyid24BbXWxxE0Fewp92rA1MbXBJAauabZBTtPuy70UUfO1AnfMGeGqnS5tRP7v
         NVfzmcD7REnwnEYkEqq7GsGlR/ZbLIyPi+AgwKQm5KCmpNRD0JByazJ3vgAX3wAdCeCQ
         LQGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx87760qmGr/P/o7KQoNG8lqh7dV1fW24kO9vsR67/tek6AqGQCrdUepmoqutop+2k2tmdaycVrtWqFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWG6DfuGPKWMsovahovBQbinOM3+LWol3BUOV7mR3vDMj4gt64
	zTDlUvgqVsL0D5+P+vwvEvSZk3TFHGDM4XSsDcP7BHG+2kdXUaTGf1faDoghPHmDXOw=
X-Gm-Gg: ASbGncsqXZGknFEhyINsKaewr3JWr9g0qfazuguDjQQpEDEmsaAbeuSFOQDQb6AAQwj
	qrq3RISHDkQmyDxLn++vVFzNTR/se9i5T1K8R36VhX+LXqjbWqODRkIOQ64+YKXbUAHmqSFxp+O
	Tkrm6tn2C299ZfUygKm0zRKrBI+V0q0qzFDr78DMX1RjneoxEn7NE2VRZQr7ktcPZbrvaPV6fql
	EDfZGSwT3WvdVZp6UxUFG/muwCIWuiqXuKrT4SUvBRWEG5fUng8sTzrraDctACUkkarU653RSjK
	FwKuBHxOyS+6SUW3f2eKc6xi+Xb3HULkpI8dQecpGFDs9fW043JopywwKTqNUMIvXrOjtOJuUGB
	CgfGZ28mN/6AUpaCdazsVR9W5gG8+tDyUm0YA/m1EemlBAy3vd5EWGt9NWu6Rey1JPj+tuFgpGq
	5IU9e4VyKxiheabOQrCKDmWSPXEMS2vzTO
X-Google-Smtp-Source: AGHT+IE+3ZRzeNZRW2uDSwhuSAYz1DPybS0fgTbeR7A/7PnBw3qjdD1fLnpVB3Ww/do6Wm+mwU1Wow==
X-Received: by 2002:a2e:a802:0:b0:36b:ee68:b022 with SMTP id 38308e7fff4ca-37907c40044mr600411fa.4.1761584357976;
        Mon, 27 Oct 2025 09:59:17 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0e262asm20776111fa.51.2025.10.27.09.59.17
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 09:59:17 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-378e622e9e3so43393921fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 09:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0VDhdxzfubXKN9RuWxBG/9vnqecjXqhUE3jvYUUeJFhIm272c04GsF0icDxoj676+Ct09cT5oEvNbZw==@lists.linux.dev
X-Received: by 2002:a05:651c:19ab:b0:378:e912:74b0 with SMTP id
 38308e7fff4ca-37907ced9d2mr462481fa.23.1761584357146; Mon, 27 Oct 2025
 09:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-15-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-15-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Oct 2025 00:59:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v67tF5f-dgqXMZFbSMbctmpkM0mZGYVAA2gyOx-GY1cSbw@mail.gmail.com>
X-Gm-Features: AWmQ_bl-KpqEJmmAdB5ZTKNvkIm9zEnVpIzMtZYC06hw3Dn_VXdqxOKWZ6n-OCc
Message-ID: <CAGb2v67tF5f-dgqXMZFbSMbctmpkM0mZGYVAA2gyOx-GY1cSbw@mail.gmail.com>
Subject: Re: [PATCH 14/30] drm/sun4i: ui_layer: Change index meaning
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> In the pursuit of making UI/VI layer code independent of DE version,
> change meaning of UI index to index of the plane within mixer. DE33 can
> split amount of VI and UI planes between multiple mixer in whatever way
> it deems acceptable, so simple calculation VI num + UI index won't be
> meaningful anymore.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
