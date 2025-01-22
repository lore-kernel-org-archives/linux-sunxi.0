Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F41221171D
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jan 2025 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737548983; cv=none; b=i+bRUCqduT59GfcOZaX/9DdkXZwMYgg94YHlmi+iivc4m9CW73oVbYUGX3oOiF5vuUBnK9KcVIMM4x7Mj0Ew3TfSxtlbigc3yb383YveKQsRMxM54aDUYC4D5ZqK9SqW7c82/Car8ICLSDufoU+A6heStZV2a9x6OL78C1uLO2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737548983; c=relaxed/simple;
	bh=ShcFnE+VEqADUNuKpYv8Brm9pJocFXr29Xz4Oic1VMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjvYOFL2EZVRMKRvqB39wq+LNd5x/DOHFFSwq7+8e/it1H/Ep1h6HzCiKE/wuRTHmSGbmk1+M1YmbI5k+O4fcVACruER4kRO1a6MkL4FBJAcACtSRLqhpHoXynx5K3KNamKMe2BvQrjrPMuV/PWsImArfp6wc7caDI6XiDyhajU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PT6vKdW2; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PT6vKdW2"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afd56903b7so1782428137.1
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jan 2025 04:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737548980; x=1738153780; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RKfDfqX2aJxApYpDKgQ/xMP3mRh+aW+Vi7f40y90W+I=;
        b=PT6vKdW2ftzB3SrZTI4JQibY5covbtW2TgOlPg3nNcYAf4ZTjUsuPYkrhCAq4r3dxA
         mn0GvycAmwTzwMUYieHHuO7y8TyQAQnNLcx0vsxZAbrW5PAisXLZRpmCTSqvZCNE8Sag
         bTlM9UzpanFg0tdBNmghpan3R4ASt+nsDLhu20HQhZw5Th8WUMEFq/3OZzTBIwi9hOn8
         ku/LOKPb8UhQOBD6ZXi7EGQ2DMBNyUd31dNu8Z6vfeZ3e0TtNBwLMw9wZz/Uu3Vc491b
         6F43YiI3MPrxdHvTqoFr85s/4/Z0rIuT77IAhJIKLVxd4s2K2bvn1MopqYMD8desdMww
         CPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737548980; x=1738153780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKfDfqX2aJxApYpDKgQ/xMP3mRh+aW+Vi7f40y90W+I=;
        b=qajFqL6DRM3bpc6ewifzw+ndle+C1BAGvmsv9KwEYBZPc2+eZa1w0jby6msIbeWFSw
         0HFd2P+g5M7fO8ZZ98MV6v+8mCc/ygkZuDXNYG42kh3ia1BWjS0076bXMVo7ZK3QQewg
         1G2xtMgGWn48ROOBuxKQmnPbrD/4mA6cktkyK9vG5WlH/xoKc1Kyszt4J2Eq2veVgNAn
         zgZegWLfHgb4OkdL8/rjajhxGITuvP0Dsb/6gMg+fELIQxLkVjVyU5qklcd3Kjn6qI5o
         6xLod25IdurMc0KO+GOLBjWveSvX35FOiG2GQXW21Rmor0hjF01Sttk/qSW8C3fd8VSt
         09JA==
X-Forwarded-Encrypted: i=1; AJvYcCURcCQM+1Sln922Gsk9XgXqHmLThAvWULKBnkFrTV69BQ4RJz13hDoc2LyLWjGKfeusESMXkB/cNosgDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBK0naxUuXyZPJ0P+1sAlCTgv8gLZRHTaY/fjPGo0fVpLI9OJl
	aVWlVrRK199eJhfMyqL5K6brKr93IC4bPC69ZzUQt0lhVQdl98G7oXQsUABeb2D4Gy6dhJPih5V
	YLAnevO3kkg/Y9cgok0uhIImaIZcZzAF6yIguuw==
X-Gm-Gg: ASbGncuMRmEymMXKlcgCI5U7K9OganNkb7qGIclFST/AAYDAOn2KoMe2HiJW0NCi9mI
	zA8WGyF/YGynhzDIfN4Jd25UPN3324GN6S/XqBubEiuRUJ/h5YKwB5VIhUaPU6crF
X-Google-Smtp-Source: AGHT+IHOW4//E3VMc8I+DoxHnxfbn5ha6Ap2Xhdcy+WJKy8/z/aYYGRLodF4ac2XrbJ5oeXSSH164oLFf84AqeV75mo=
X-Received: by 2002:a05:6102:cd4:b0:4b2:c105:dc40 with SMTP id
 ada2fe7eead31-4b690bfc8c0mr17831596137.8.1737548980258; Wed, 22 Jan 2025
 04:29:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250119164157.23648-1-andre.przywara@arm.com>
 <CAFA6WYNAW_KTK5Evs0e_d0c3g4uDOVOZ6dbeF0LhVhX3tUrZDw@mail.gmail.com> <20250122111905.4dcbceee@donnerap.manchester.arm.com>
In-Reply-To: <20250122111905.4dcbceee@donnerap.manchester.arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 22 Jan 2025 17:59:29 +0530
X-Gm-Features: AWEUYZlZQgZ9MOqoPvDj4JhEc4D1kV86S-Cw8EnJSXuMeXVtt1livJXOKRINzEM
Message-ID: <CAFA6WYPaoRG=e3gGZc=+W-7y=i7qDWsqe+reGWFYivt5icVUUQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] sunxi: switch three SoC families to OF_UPSTREAM
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, 
	Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jan 2025 at 16:49, Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Wed, 22 Jan 2025 12:03:24 +0530
> Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Hi Sumit,
>
> > On Sun, 19 Jan 2025 at 22:13, Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > This series converts boards with the Allwinner F1C100s/F1C200s, A10, A10s
> > > and A13s SoCs over to OF_UPSTREAM. The .dts and .dtsi files were
> > > identical between the kernel and U-Boot repository, so this is a
> > > no-brainer.
> >
> > Glad to see this series especially the diffstat.
>
> Yeah, love that too, though the mailing list server blocked 2/3 and 3/3
> initially because of their size ;-)
>
> > > However there are four boards (tablets, I guess) that do not have a .dts
> >
> > Can you share the board names you refer to here?
>
> Ah, sorry, sure, it's:
> iNet_3F_defconfig       sun4i-a10-inet-3f.dts
> iNet_3W_defconfig       sun4i-a10-inet-3w.dts
> Ampe_A76_defconfig      sun5i-a13-ampe-a76.dts
> iNet_86VS_defconfig     sun5i-a13-inet-86vs.dts
>
> As you can see, they are extremely minimal, and also identical
> between each other, except for the model names. So there is cleanup
> potential regardless, but we have bigger fish to fry.
>
> > > file in the kernel repository. For now I kept them using the "old
> > > style", so they continue working. This requires to keep a copy of the
> > > SoC .dtsi file,
> >
> > Is the SoC .dtsi file present in dts/upstream? If yes then it is
> > better to not maintain a local copy for them as the local .dts board
> > files are able to include SoC .dtsi file from dts/upstream directory
> > too.
>
> Oh, now I feel stupid for having not even tried that!
> That indeed works, so I will remove the .dtsi, but keep the .dts files in,
> at least for now. Jernej has a point that those boards could also be
> removed, but I didn't want to pull the plug too early and unnecessarily.
>
> > > I would be grateful for any advice as how to handle this
> > > situation best. Ideally we would submit the DTs to the kernel, but I
> > > don't know how feasible this is, given their age, the missing device
> > > availability and their basic DT nature.
> >
> > Lets have only local board .dts files for them including other
> > dependencies from dts/upstream tree. This will at least give folks who
> > care about these boards a chance to uprev the corresponding DTs.
>
> Yes, I agree, I didn't know that this was even possible. But works for me,
> certainly.
>
> If people don't mind, I will apply those patches now.

That's fine by me. Feel free to add:

Acked-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> In my test builds
> the .dtb files came out identical, so there is really no risk in this
> anyway.
>
> Cheers,
> Andre
