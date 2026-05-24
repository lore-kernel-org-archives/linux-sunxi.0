Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B45F305664
	for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 21:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779658145; cv=none; b=pzNVWZr5KMm/Di9ntYWXdWlBYLhfzWQbWL/wktn/dK4kDF0Q95JjxRqYSBmEidlL5YGrZfYBQVl0lxsW8LCl6frsn6VG1UGiSXz+ApcbgbKqBNhCVr9RIEAc31MoG9D8dolSjzfpmtSv3qqKYwCsJ+fxAjp5UV4igMsw3FnvLOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779658145; c=relaxed/simple;
	bh=6w+/iSJRWut/D1sqx5dV3SWtkjaFwtBwoEXiJRSLQ+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WEPgyJDpeRLnp8hCR6H/DRar086BdKCZkDFxumkjKqqgsTyyY+NT+/3vCLaG9iklxBOgRihkmctLPtTT8B4m9UTJyxuB7hN+fcA9Jcjn63CgmgLAY/A7/1+KyjCw/X0fImxSAauwf7Wr7nnkVcm8PZy4LKI5oOrjBjZWSOcfIis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bd01481e592so1248615766b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 14:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779658142; x=1780262942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6w+/iSJRWut/D1sqx5dV3SWtkjaFwtBwoEXiJRSLQ+s=;
        b=Sevs4GAJJ3gqQVXUALQbDl7ODhg47TIKYOKiKll9/wcFQ33EPoJhem0nrsVImGqurV
         DKbSEoEbCWWoiP1eEQ7XhL7O+nxdiMoRcOJIK6Mt03r/Cja8Th2R9LEYs/wrF6PF8Qij
         X+sQ9qeE64To9Ekz3gfc96b9JkYJNX5CPm0YwjFL0RkvPwREhYyclURDsh5YUhtMP0Vt
         eKGm+YBcEB7qXu7PrSoOyHtojT6nHS8XpwY2zkJSTsq98FOBX3c+JvVf+d0raOoABzXC
         7Zh38Ti1Ax6GwwXsC2CjskaCS9WemTzNbDc0sflrD1LqSA6GWugYohQDW0rNgxfsOsga
         DQgA==
X-Forwarded-Encrypted: i=1; AFNElJ+ma6kW6Uw6z3rOIBi6wo0sozA5U7v01s/rUHVVKgRb6YctEA5fsIHKYa6y06TTPyHivZRMZhujzXLFMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyX8GFguFJqzG42BdfIAHBdbwB74drh/R9aXpeLY68Z81iB6e3n
	5UtMLHg0k2zTF1/E3RB7X2rBVnkzyf2wbRoPkV6EzPJ+EWey58m0GKm1nf3FCUQdoBE=
X-Gm-Gg: Acq92OGxEZVE83ecN+2BH1mfRJfRscohAE+sWB8iON8PRlbphfYr6SZG+ZiLShIu/jh
	8Y2Rg+usvx5qUowVkJEH3OMFpaUIRMMP6rFMWQirhpNpfcPEYa1j4Qwm5QujwwXDmoNufNlpHYd
	P8oYMPqSWegko8SncWTNUOuooreE7g2WcgIAhZASIMIUCLfu5gFxqjhHmXfIqjF6AZCrVV5AnTT
	2vahYc5x6p+NCSkY9j05v5Fxq3IjXocC8iqnFnanjzNBDVe7wB5b6adOcBtAm0geCzc6uHjkTLQ
	pj+KjaxKvbNyTjMPntaqtfA+bxpJrrapvgM+92q/IZjoOBNbSwfc+vgp5BA4cBjfujBFCMwBeG2
	PxH/HV/9nu5rg0E+/xYCW/dW8forsRE9zrfKhvQGUK7NZyKGEE/Q5rY4qfc1FK/F4U0HXcV7J2h
	LL8sVmIkjY8bkhFnA+cg1eRD8jpiaPOU2SYwrI4yksUpq4ZZ6KHeMXH5EfF4Q0Bg==
X-Received: by 2002:a17:907:b5a3:b0:bd4:d6a4:ed58 with SMTP id a640c23a62f3a-bdd25ed7e53mr490419566b.28.1779658142264;
        Sun, 24 May 2026 14:29:02 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc3050fcfsm328006966b.20.2026.05.24.14.29.01
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 14:29:02 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44a044cb827so6729310f8f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 14:29:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+jwZKKXDTDzGP1jXAj7kRegSLUZuhYMgp8tm1JFlYVbq6kMVLP5MFacUDeei0QD0Vu4SO5Kn2d092ulA==@lists.linux.dev
X-Received: by 2002:a2e:b8d3:0:b0:38e:4810:4f44 with SMTP id
 38308e7fff4ca-395d8bd88a8mr40151971fa.4.1779657657216; Sun, 24 May 2026
 14:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
 <20260509190015.79086-8-jernej.skrabec@siol.net> <20260514-valiant-ape-of-discourse-a4f5a9@quoll>
In-Reply-To: <20260514-valiant-ape-of-discourse-a4f5a9@quoll>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 25 May 2026 00:20:42 +0300
X-Gmail-Original-Message-ID: <CAGb2v64UvgqOPuZwayBmSUhQA1VwBBDpFn7ok0d7OVHjhzz=2Q@mail.gmail.com>
X-Gm-Features: AVHnY4LF9PZK6soJXHv0nl5iKDfqAVEgS-xhOR9JBN-5Ngh0yXQO9LbOCoc_jy0
Message-ID: <CAGb2v64UvgqOPuZwayBmSUhQA1VwBBDpFn7ok0d7OVHjhzz=2Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33
 layer reg space
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 14, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > As it turns out, current H616 DE33 binding was written based on
> > incomplete understanding of DE33 design. Namely, planes are shared
> > resource and not tied to specific mixer, which was the case for previou=
s
> > generations of Display Engine (DE3 and earlier).
> >
> > This means that current DE33 binding doesn't properly reflect HW and
> > using it would mean that second mixer (used for second display output)
> > can't be supported.
> >
> > Remove layer register space, which will be represented with additional
> > node, and replace it with phandle, which will point to that new, shared
> > node. That way, all mixers can share same layers.
> >
> > There is no user of this binding yet, so changes can be made safely,
> > without breaking any backward compatibility.
>
> There is user. git grep gives me:
> drivers/gpu/drm/sun4i/sun8i_mixer.c
>
> which means this is a released ABI. As I understood, the old code was

We held off on merging the DT changes so that we could rework this.
I can't find the actual request though. It was probably over IRC.

> working fine but just did not support all use cases. Why this cannot be
> kept backwards compatible?

AFAIK the "planes" block is shared between two display mixers. As the
commit message explains, this prevents using the second mixer, since
only one of them can claim and map the register space. And on the H700
(which is the same die as the H616 discussed here but with more exposed
interfaces), there could actually be a use case for the second mixer.

Hope that explains things.


ChenYu
