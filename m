Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E5B40C03
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745170988; cv=none; b=httjsnFniA9J3WZZU1aBiHwy6onagWdJB3qtRHfkVIEIoqNS0/rwKJ8rOAZPqfGbwJxixzsM/l7oYW/Djt5uc2YkvAkrVi/atWCR/qeE+XdwNnfBHjOvDc3k95Yxq8Y72sklbUzpabwPVwr8gOd6rXwtjLl6FRl1F0lWztTqN8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745170988; c=relaxed/simple;
	bh=OT8hAojKfGBI25DAq0ChA/nI2wFKnqPVqTBHSwlWrro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puoEjFQo2gTjT9qRPgVb5WItfihNEUvFQeLP3Bduy+lyRalYFk274/vzuJnbFuKrk4TEvpAkDsU2MOixGNQNvpl+D2k2bIHpNlBFug9IwtfvbxpA0wbY2lS8kahJC84L2D65qj1yLp1nCEmYPbwi5lCvqEj65fe4nQH2TOv91eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxuTCk/C; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxuTCk/C"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso2706404a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745170985; x=1745775785; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=94OI61Qmw868CLwlFK0a6ayGGnbK7PL1vRKgwcsJ6K8=;
        b=CxuTCk/CQfwoW7ByW0dZan8qbRaDSR/KHXqGbR1KTF7pGoZFQVqvfMGvUrLCvo4mlw
         f5bu4aCOOixFxqBqT8S23MGJkOCPMRNgTRQrlxj68mSA0emBdQqf7BC1ySK/it72HKHF
         H/7hmT8w/283YjSbZmAxfdtGhHGOPFAn2/9gR34jfwYbZj/+Az9bvMDIaVf5whM06MND
         c8fWdV6sFGTlBgFDJdXr7GOj+RvFk9jKSogi+rCgdFupQuVSqsc85rBjYz1RACKujyn/
         5s11hYNGwZNuqaErGFawfArT8Gcc+SLVOhdkdUJz1kwrU5iUiNz11KpAXdnldOaJP1HH
         IJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745170985; x=1745775785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94OI61Qmw868CLwlFK0a6ayGGnbK7PL1vRKgwcsJ6K8=;
        b=fAh2BeNowdwcdUa+PuYSA8a5187cnMcfECDUmeOx9MFNM0pIyP+tOGnrscwf9wP+1l
         geLJeLrAL1I6InlTQOg8nIt4iySqQB+7+ZeSoVNb56Mq0pdn/CcCWtpQ4R6Vx8csglg2
         PxtWpUitbGILZQ1bPTBrvjKJ6nC+AVK9pyK8NDk5BJfS5NEtziXh4nuXhNHI6IJtYzZE
         Q55J/9IYGGxmRsVA+HGWnnwPSPuU7qAFqK8hZ2f1zeVk9uFA6kfagCNo4Eon7WM2XvmU
         k2k4m07qdHeGUkBSPQpfV16N+cvYfgOSTRGWzwcfhkJ7D89w2IVch4Sef9ur3i/dxP2W
         gd3A==
X-Forwarded-Encrypted: i=1; AJvYcCWXoWEhKQsJyMPwaRl9MDNXAcJYoVugMld64TGsYkDRxokeCHc0gtkOAfbYRvxseQL71nXB7POA4T/Mng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1kRgKTC4FmpF/PVjQjd78aynGsMe7IgbF8C8tLsFDPIiOiG3n
	4866Y0cvmBle4VffOCpXaja6QVmYUcT12vJ73RSQbUhEjykruPOPJWuD74i1DXohxdQ4hkAF/0L
	GhB3fvuqWZ/8mpdUMOH82GCktLXk=
X-Gm-Gg: ASbGncsQwCihaE1+p5qih8nkVBDeb8nVPfrFZjdeYeSi/WAMr6RnAtAx2RRsvYnVTya
	kLnSnB5ZdmRrmzWvgB0GEAIeEyuUdi4I/CKmPy60jhzr5Z7fnDPUQLtZF3EBbgKv478eCsQulN7
	s+p7XEvThNov4LBcm2S6CR/Hb+jE0AVG7nKWfKS+wIvZAVcCybevGqtWM=
X-Google-Smtp-Source: AGHT+IGm/qhW7RxxGqgE9TkxiPozSlJRJuNqpTAlw8fbvhCQ/C7aEOmO2pE3XGjnDP+M+WAyZpU48wYHvTvZagWzwlQ=
X-Received: by 2002:a05:6402:1d4e:b0:5ee:498:7898 with SMTP id
 4fb4d7f45d1cf-5f628594334mr8047875a12.17.1745170984482; Sun, 20 Apr 2025
 10:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250419160051.677485-1-pbrobinson@gmail.com> <20250419160051.677485-3-pbrobinson@gmail.com>
 <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org> <CALeDE9Nyt7Di2_u-Vf=6OCAg-6wmbz75Cs_MCfZrk6upbD9nZw@mail.gmail.com>
 <e111f8b9f499a158af5fad1942951e0f@manjaro.org>
In-Reply-To: <e111f8b9f499a158af5fad1942951e0f@manjaro.org>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sun, 20 Apr 2025 18:42:53 +0100
X-Gm-Features: ATxdqUFjSHoMqdkC-Lh3e-QRl--9tH_9W7-UzywjrWL3LtvJJouCNr-dcednj7E
Message-ID: <CALeDE9MXE24mdxPNTMYroZG4Wa60bAGCJ-3rFNgpoB3U9JkEyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Apr 2025 at 18:17, Dragan Simic <dsimic@manjaro.org> wrote:
>
> Hello Peter,
>
> On 2025-04-20 11:33, Peter Robinson wrote:
> >> > This adds all the pin mappings on the WiFi/BT header on
> >> > the SoPine baseboard/A64-LTS. They're disabled by default
> >> > as the modules don't ship by default. This includes, where
> >> > they haven't been already, UART1 for BT and mmc1 for WiFi.
> >>
> >> The patch subject should be improved a bit, to include
> >> "Baseboard" as well.  Having just "SoPine" is a bit too
> >> vague, and it should actually be written as "SOPINE"
> >> at all places in the prose.
> >
> > It literally has baseboard in the second line of the description.
>
> True, but the patch subject should also contain "Baseboard",
> because SOPINE is a system on module, and the SOPINE Baseboard
> turns it into an SBC that actually has the add-on headers that
> the patch addresses.  I hope it makes sense.

I mean it's pretty clear from the file that is being patched, I think
you're splitting hairs here, but I've already updated it in v4
