Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A1927A130
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761580827; cv=none; b=G3CHxTalLlJmjnKMpFemCPptLlZAXQadmWkyewsov2dd7jgXxvjnxpT71EXeVQTAmvKIHZREkhUAYEydQlkQnBBsCUc4295BJAonX25Tfq5iKbQBCaCreVswPgX3tlEOng8dsYX9vcecpYpOhugLGGoAIkI0yGf6U0S47UCpNqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761580827; c=relaxed/simple;
	bh=TruC5Rz7hFXrB8am5aWkkTb/6jKbCZdXFPpjwUZibfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RaWaPCvctxsdQxAvlMoc2uJ5HNSzvlMi5rUnzw0VHoPGWzTMU5OC7PWc8QSlhk/CIwnKZGGKYaEVRbgxomw+5YZg4oURp3PAtshuc4JFu+21eAkZHI0E44ag33BTVmcwA4An6c8bwnuVvoDT3ioyHJEaFakq2LAB+OSh1j+vxFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-591ea9ccfc2so6198106e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 09:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761580821; x=1762185621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YwhOXZKSbw/QgDI8R5plvx25chz++lg8tg98IFV5D8=;
        b=WMB3ySn+W8K4QY+lnovXIdEfGFr6D05g/307KZve42G9Nz9wCaWkX4vDsA5JPQ0Ase
         q/6BWBLxw5FFFL6Zsy391IuJry7i8INarT/o15fvVExkoJVUn7JCfASP7wkf8HLVu1qy
         dDipj01QZp+6drcaL6Chh0ypu5Z1J/aTmVEw3Y+HV3oidHbKwJz/xlKkSY22MYCzKasj
         XP//eWhiWQlZbcaZuASIuEoSWLLjcE0oHlTVnGOkPG4hAT2Bp/wKFhm14j/8ZVV2oCiT
         bo2DKXZTouGctu4OBYJHZhvks8faJLxT2FJcAGT6I6ZyrGo9xWBXviEatB+cqjy/qZyd
         RL3g==
X-Forwarded-Encrypted: i=1; AJvYcCXLa71B9koZ4jN8mxYzWINJ3s4qx9awL8cHhjUb6nBroBOsCTPxojaePRF8Z0Pei0me7CR4ZDmyhQlyoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNSXuAx2K1yckn+x2xMnnW/f43lasIf+u3Wf8Q8yVLjWg8n/JB
	Sa0kmYbq6S/G6BrLHQdjTwjGrg9duPTgy5I3oZ9errwNK1k/fsp+A9jojzl0pOR0JCQ=
X-Gm-Gg: ASbGncuqwYBWWdPJ73bHgpRilqVXwAXqL7ZwT0dzl9QgI5S6dMeVON/hXRMttd7eeoZ
	FgPqCmgBoGGeg52SIHYTJ3CRGSt7nyeg4naLN5VEVEwuqxXpFt1bJhRJCfsLhO6OmqvVyiz96zW
	mJUsrU+zqBFbv83/ZlN9CYZsLKiIW0+yqbiDsdbXIe7QWIWmetCVKXYBOiMBhdHO85oG4409+5+
	XPN3poNk8YckgcPLwkwvbnv2jUyu1Adf39wd2h9RwtKEdpm0KQ0wD1r8efe0JNy4qdtp+jSxsnc
	KUsGfGa+USa98jZqpjsnkDDB2/dgpK9lVPS6ZsNnbQUFlooxYuScNwVzl468YlGsjq/NCmQxLYU
	FykMHdJDcx/2zjFb8m2UmxXSp/ScCToUMIOtP73msg2POihpdoVG/COZlHL35U5DAkJ7O1m6Nwp
	0LUwAlHHWQ6mev0hatwPlV70GJrvsafntn
X-Google-Smtp-Source: AGHT+IGThqGeCZ76jQqBvNg79DRy/z+1Sdv/2/EKaVBJJev8L0c0bJsnBgidS747Pmv7eJrQoUX5cg==
X-Received: by 2002:a05:6512:3b9c:b0:592:f2ba:b6a with SMTP id 2adb3069b0e04-5930e8afac9mr209338e87.13.1761580820401;
        Mon, 27 Oct 2025 09:00:20 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f6c042sm2472662e87.77.2025.10.27.09.00.19
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 09:00:19 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-378f010bf18so20738501fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 09:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmZGeFoB4dd6K1ycv1XeAebx7/eKXVXDkchbRu1la4nweJkG6o+OZXbTJQjFV+Ws70GRaSYu168MYsPQ==@lists.linux.dev
X-Received: by 2002:a2e:a7ca:0:b0:377:d151:c090 with SMTP id
 38308e7fff4ca-378e3e0adfdmr38098431fa.1.1761580819015; Mon, 27 Oct 2025
 09:00:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-8-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-8-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Oct 2025 00:00:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v65KEKPtg=WZw9su_DBc5JKsjjYV3DmpUD+LXGhX96sEfA@mail.gmail.com>
X-Gm-Features: AWmQ_bkrUs29MfoNSjd071G9lNzBwjNkUIcpLZfwjGgRDO3VQYGwungCMVXDTOo
Message-ID: <CAGb2v65KEKPtg=WZw9su_DBc5JKsjjYV3DmpUD+LXGhX96sEfA@mail.gmail.com>
Subject: Re: [PATCH 07/30] drm/sun4i: Move blender config from layers to mixer
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> With upcoming DE33 support, layer management must be decoupled from
> other operations like blender configuration. There are two reasons:
> - DE33 will have separate driver for planes and thus it will be harder
>   to manage different register spaces

So if I understand correctly:

- the "layer" is from DMA up to CSC, which is the last stage before routing
- in DE30 and before, routing was limited to within one mixer
- in DE33 and onward, routing is global

> - Architecturaly it's better to split access by modules. Blender is now
>   exclusively managed by mixer.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
