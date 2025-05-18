Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40983A55
	for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747586528; cv=none; b=IbkG5thQFfs4uNNt+AeBzOgWQiSUy2d91FQJhxiU9xhECIKnidmodJBnhqb0nxQJvwmz0DpXLxjRcH2tyCxKNXgWb/Cm/S30Hp2fkRhIco/XiOoMTJVD9iHwTfVJCNmo2to++mLAZC2FISjgBaRLkUIxbzQYQsJqjBtBPNFaO9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747586528; c=relaxed/simple;
	bh=wD0Py1Y+nYCa3T32gfjqbB8qmXGi889eEZKva2VRulI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GsU7KwcNi3p7aJJ3Yx5pLV0fW3XUxqypT98pXBbIfPX7Q8VZdPww9iodNrHgVLsYybbsp77asEBmwxyKSfeeX3atIq56/FxB6ZbTCsVnAtE04eJkPIoiBjlzaMqfGChUzRAGdf/v9QY36qy1twEzXkrpgW3S2LIiFtWZyzzWJJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-86a464849faso15797839f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586522; x=1748191322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wD0Py1Y+nYCa3T32gfjqbB8qmXGi889eEZKva2VRulI=;
        b=bfpptkelM+Av/x/e6uJhs5dXMKdGL0PTeFsIeXTBPge4MV73WYfAfcQeVF5YE9yvp+
         0MFHi1CJhthQ4B5WlOIyKeOzwKUKmf1aLO1YxNVcZchg2y/36knrMHATHN4/5HUw/zL9
         xBG5sNl3zI5ylZcmiRt2NUBEAhIqoTmxYJxtBBzXboHK47UGAFSINWSMmIRPZzCjTDf6
         QPzvuuf6NOSUpKBbyoaXOoSI7Lt4LlT5HK9VlYvs6F8nbTL7F4Xa6vOx6XjpRSMT1jXu
         cj5/SKxY2j0FzbOngj4yWpHxYTYMmI2Yt3cX8iscyk2TA0qvKqkR905vhrgb0jWDaNik
         Fb9g==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7kCV2EHLF+4fPxMwfqAUeYr0OOTEuYAUG6u2RnJ0sfgc0kWOLgs21Rdowp7XQ+uW8QBptdDhuj3YnA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9HRd0w58xaf5U/e1NDjnSu9r79d4HF778zXgKz0zr3QKtccUP
	CmEE7IsrXejZV8/DU4mFu81OGzjs/R22PmjmSBPa8bV2MouFMULezroaXy9rT5h59f8=
X-Gm-Gg: ASbGncvVPXVFcR0PNcYmxPNZi/FLjsyVyCDsXkl7i8zuWxilHK9FSjEF2Jh1xUaD+pC
	3Ew+fKYz8HdhA0HS2oFM7JBuuiy/YazC83NxojbYYJ3P1+zDsDkvOTQSB4xIjMlnMvAUM53mpEf
	aJzZBpVuonzOQTtFVpZU8V+ai6eSa6BPbaB7Wz60ctQMgqMeUcD/3j375ngF/WFaTixfN6tlqFm
	aXnRpjXHcWuuLOHdWtdTmBPWD7giJiT0m7blRDlGiLx+0+Spu7QYHdnl5dKKkRV++Ct1jRxlx7L
	B05FeGdcOJEhyn1wtr7/5dzzEeoYesAt0MJvmiVz8S+yxKo8WVsyT1WCfWJ1Fgkc1R7Ziy8BHcj
	cHdsJX09l
X-Google-Smtp-Source: AGHT+IEVAH5TgdhL3ivJzPU2P5neNWgQj1T6+rE1bfjE5/b13qjycHlk1Pa/kQdBezanKbU4L7X7jQ==
X-Received: by 2002:a05:6602:3f0c:b0:869:fc1b:2194 with SMTP id ca18e2360f4ac-86a24be4576mr1412869839f.6.1747586521934;
        Sun, 18 May 2025 09:42:01 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a236e68ccsm130719539f.33.2025.05.18.09.42.01
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:42:01 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3db7b3de375so28544885ab.1
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRJpKP+EIjpf5Los0SvQD4Y1htSwumTmmIMPtq8ZC5Rl+DcC1qfUCKnGYek1I76Km2KQF1r5YSiEtu5Q==@lists.linux.dev
X-Received: by 2002:a05:6e02:2164:b0:3db:6fb2:4b95 with SMTP id
 e9e14a558f8ab-3db857a6f7fmr111584635ab.18.1747586521124; Sun, 18 May 2025
 09:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-5-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-5-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:41:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v66+c9j-uFn-d59VkP6Fk1_af7i=0sWJxSTmp+3+A=+V1A@mail.gmail.com>
X-Gm-Features: AX0GCFvx955idocxBLHWdxaZkcNf0j8vEssSsAEhRIcCueVqPuT49DZqnymord0
Message-ID: <CAGb2v66+c9j-uFn-d59VkP6Fk1_af7i=0sWJxSTmp+3+A=+V1A@mail.gmail.com>
Subject: Re: [PATCH v11 4/8] drm: sun4i: de2/de3: use generic register
 reference function for layer configuration
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
> Use the new blender register lookup function where required in the layer
> commit and update code.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
