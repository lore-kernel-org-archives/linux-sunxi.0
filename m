Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC781F9A91
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Dec 2024 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734458473; cv=none; b=J/1+UZ4Qy62YxFxfLnySR5n8ktfJF+pjTcl5OLTmMfKbDp5bIsvqUTVuJhfXqJDhZgj20iA3vd7lHoa5vsJQieVF7gCEltzhYL4JUlnI1KvqmUqvAk94GzqG+8jxReFIJIWBuvMoceHK4DhtZnawbdswhFctt9+PwKRbAwlYcY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734458473; c=relaxed/simple;
	bh=QC/c1n5Jks7m2uW84qsP/rNoe34vEW18ChfBNCtXubc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5ov4lN7fSC5OJzZdWJKwbLkhujz8HAmf9efICQNtqyyrfc9eFf6HrK0q026XWitimrRitcLLzYY8q6pSr/sECpjmLJQrjTV5ksa5KMNSO4bkpUbsxOPRAF3TZE2C4e0+1yS+OLezzE2lBYQ1Ciet0viCWf/LBnWdQXHC4ZE4wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mezSYUpM; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mezSYUpM"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-29e842cb9b4so1772880fac.2
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Dec 2024 10:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734458471; x=1735063271; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiwHnId7iQeGUr8OsM8sKryugiv1jIm1WvtUfh1wJ+Y=;
        b=mezSYUpMeL15aKKY42GhBbXT/an4ioMRvlnIQDR1lLUZmxZvHaqtOWvdPOWW2vpPH/
         QRtdjwQUMboxvRcIPZQn3L05tMx5Ek+PZxQnF5KtADMrBExOzMwmG5sdrixcQ5Pk9sZW
         QY0mqGrZ+uMF4rlg0RgsZQc/8tlXOGd/XIUn5lzw2q8x14kOAZYZ7fiS9tK7f9gLde9b
         0CMvU9y9tDaI2AG51n8XrNBY70V3wgUEgh9tuL1CJfyuDtu+QtlcQl7iTDD7jPW3q3/C
         caP3v1PLO9MBYA7w1Mv3RyFKSWrKNin84sfpdR62zxwglKr9bb6YE8xZ/c7TaFrUl8Lw
         3Wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734458471; x=1735063271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiwHnId7iQeGUr8OsM8sKryugiv1jIm1WvtUfh1wJ+Y=;
        b=dMlr/TWRdY2bUeBl8rLi/poNlC5LAAz5YNFPs3a8hANsV968nkoa8SHeYE0lvMIHk+
         Jo9G/zPgmwOuF1x9rTRDnalG3euC80Wjep9Tq3wMvKqIq6NTvgU+bCvTmiXrLK7iJ6CR
         hNSsFx9tyxB6nRWdYErEZQpMZS1vYqAPOQytLB1Z2Gu13jTs28t63S14SaUKirMFZtRB
         FA2j5o+py1RdO3kbG+Vr8vl9IWYAp9X1u9ZEB4KVuP89NhbCaBVEp/Nnd1wnbB4nQ496
         GssB6oliq/52JbFkI33jSKyvPUpEFvkHn4WGZN/EXAzaMzgwlcWllNJA7oxHk8y2Y/Ul
         sHfg==
X-Forwarded-Encrypted: i=1; AJvYcCXFv69pemFM9dtVvcrL0Qp/1aFOnd46IN2rL5xVphTOJWLby5ycQPe6XOKba/RWIbWPW2cAvF4rDQ/Pkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMo368TwI7CXRgwbtqw46MHKBzMDloIn6SzuVhPtjIKsovK9wN
	bI+buUlrDAlLteSlrlRuaY91Mp3PGS+eyjlb0tFrao3Fwiuo8Ntk8SV2KgBYPIs57Q3yRRVx7Bk
	6jJaQuArFz7wpfNINv9EVH3yb9gA=
X-Gm-Gg: ASbGncv4PrwaLfWlCEfm62v3Bu4t7k+bSxzAviJzQwNl7XNLGMBcrgPYpzMoMUpQ5VS
	soBxpTLUTyN663bHn4GAkQZiTnDgLnAPm867VrK++TTWMHl3jsoso84M5DAnviv6eVEJ0hFLN
X-Google-Smtp-Source: AGHT+IHd+3ZVfpm2NDJm9bWCoeeRHqvP9fk+8IUJThjwea2MK0kqPI6ZhSam/HTj+u/wwVy83PXt4Sd7guaeIDXPgdg=
X-Received: by 2002:a05:6871:823:b0:29e:2422:49e2 with SMTP id
 586e51a60fabf-2a3ac8e1087mr10260963fac.31.1734458471419; Tue, 17 Dec 2024
 10:01:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241215053639.738890-1-anarsoul@gmail.com> <20241215053639.738890-2-anarsoul@gmail.com>
 <qbtp4jvkx3r5azufe4k3vtapqpfs54dyjiu4cy5v5wkkzumrzx@vy3xzkfplbue>
In-Reply-To: <qbtp4jvkx3r5azufe4k3vtapqpfs54dyjiu4cy5v5wkkzumrzx@vy3xzkfplbue>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 17 Dec 2024 10:00:45 -0800
Message-ID: <CA+E=qVeQ8uHBCeFtw6_2cY3252-YXc6eWrf5_YdeVgbp5LJo5g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 11:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sat, Dec 14, 2024 at 09:34:57PM -0800, Vasily Khoruzhick wrote:
> > These will be used to explicitly select TCON0 clock parent in dts
> >
> > Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON=
0 mux")
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
> >  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 +

Hi Krzysztof,

> You cannot combine these changes.

The patch basically moves defines out from ccu-sun50i-a64.h to
sun50i-a64-ccu.h. How do I split the change without introducing
compilation failure?

> Please run scripts/checkpatch.pl and fix reported warnings. Then please
> run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
> Some warnings can be ignored, especially from --strict run, but the code
> here looks like it needs a fix. Feel free to get in touch if the warning
> is not clear.

Yeah, it is not clear what do you want me to do, assuming the previous
similar change to sun50i-a64-ccu.h did essentially the same, see
71b597ef5d46a326fb0d5cbfc1c6ff1d73cdc7f9

Regards,
Vasily

> Best regards,
> Krzysztof
>
