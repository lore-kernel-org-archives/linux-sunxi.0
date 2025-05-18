Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EEE202969
	for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747587256; cv=none; b=Hgj0rtZpmBpr7ubteGZaimrCwRO44UoUZewxSHvrxJVU/XpK4SRgEq+BuxGIgxY7KfYATQ+nZEWkYcd1oV8+vvKi/YTjvxDdwr8xGq/VzcxJYYvBVNYYq/nWOgDBwNn0vxql7vLIEyCnfWn6AIa5MDs0TLvHEEWj1CZcLmPfY5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747587256; c=relaxed/simple;
	bh=STMuo8/qd05GfAY8QU0fDaRLs2uLrskCqPaVJINbTME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbiVZ/NL5X+yWtu1hYHhb5cDwQqFqvGpRgruM8edyj15g/ZeDjcS3DXSCeRdi44oMc+IhigDN5XdX7D/IEemtS5u0fGj+TZk04jGByRX0ESYgekDswbqpe2EvlqyrAjSLn1y9CGLZ81fxbRCy1gtI22aWhwuKBLs5Y/+0+rrcpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54d6f933152so5463494e87.1
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747587247; x=1748192047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STMuo8/qd05GfAY8QU0fDaRLs2uLrskCqPaVJINbTME=;
        b=q/SfWhXC73JL2FnMv3zE2Gl6s5xX57qyVhV865BAMRFPRbWiN352qRRjCBZFYwkI1z
         W+MuBm+Nt0M2w8l1qZkNbhkoZjJZu2DeSX1mj0EYUU7D/i37b1Zl8w/lXeqEwFy/q0Qs
         HR3ILRSbp6HGQDIAPn7yQjDucCG8uT4xK67RwFLYVo4Llt8/2+F2chb/lRqLXnqCHUod
         K/n85xBP+vlsibTf7wLnqbmysuiGjmb4jINX1f+5zJ31rZ194KkId8OLgMdzN6H6Oe20
         QvpC8VFhgJ2ATwJwWMv+xuFGZj2IaygGLdzh8Sz3EkJP2kv4sXmsHkYwgSNLbCRrA/UZ
         IGiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVhgHLy7HGRYsw1aq198IYxAI4FqInT22VYYmA3LglHORt1OkihF8FGpH1DuEIjZQyoXyuL7eJk+PgBw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyZJk3Q70ycy4UZUhL5z/P0RnHAu7jBdvZgohtdLSYLto8SgET
	uVd+R3u31nRGrSbrCx49IZpPQzBlol4TyNquovkCqH0J4MxbPqs9wSt0kgJXPxKEtJw=
X-Gm-Gg: ASbGncuez/FFN29Ktf6dFWtmRPjRfMCGAzopyU/oSjIoZghXoVErqm+WniEwQfdEpS4
	G1t3R5Xas88f9a8W7Ch/kgfz3ZYQSW/T6u3HRlhXXwRFz10DcWTB/ofL3RwfY0NDggVXYi/3MEr
	NjBENYebr5Ss809B6dsmmTJwZ7ha2AszBI9DypKYfpJXfZ7UYy60FklwDyA8zpuf38fVZcMW4gj
	BeuDrEk3ckn/t8z0duKkI+quM3hTHBpUjyR5apC1J6bev7qTt4hZw+6NADLWv3VQjeugQNCCmuB
	uCOL7VOsmUE4VbMILFAi5Y5YnlgxsoHMUtV63qYdQGBbYmiveAfYOaqmx3zMLUu+ItAQhTU3pHn
	dNXOl5/uI
X-Google-Smtp-Source: AGHT+IFBfU4+I1dUhTRZ4qSXhQY+MoH8HGvNi3RsgSyyTclKs6cpRDn5my+Nb2Qmm3OwtFyJwluY7w==
X-Received: by 2002:a05:6512:230b:b0:549:903a:1bf with SMTP id 2adb3069b0e04-550e9906dccmr2386543e87.48.1747587247399;
        Sun, 18 May 2025 09:54:07 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f611sm1481231e87.240.2025.05.18.09.54.06
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:54:06 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso35824431fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:54:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0kcQ5917cc85FZG7zqfkux79h1NvBgpAajwjcoI10K2tEh03/BJJ8WskkxeDnohJSrYHFOIopqUu9hQ==@lists.linux.dev
X-Received: by 2002:a2e:a546:0:b0:30b:fe19:b07a with SMTP id
 38308e7fff4ca-3280974cd4bmr28754701fa.25.1747587246119; Sun, 18 May 2025
 09:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-9-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-9-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:53:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v64v_uDKVs0QZkC43fH9aiBbyBnVwJVYNWAHPe2GMtwo6Q@mail.gmail.com>
X-Gm-Features: AX0GCFvgY9QrpGrKT96c6LVa08NAsANlz2uVfwNxjbxYFVM6-idz9sCykjNFd2E
Message-ID: <CAGb2v64v_uDKVs0QZkC43fH9aiBbyBnVwJVYNWAHPe2GMtwo6Q@mail.gmail.com>
Subject: Re: [PATCH v11 8/8] drm: sun4i: de33: mixer: add mixer configuration
 for the H616
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The H616 (and related SoC packages sharing the same die) carry the new
> DE33 display engine.
>
> Add the mixer configuration and a compatible string for the H616 to the
> mixer.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
