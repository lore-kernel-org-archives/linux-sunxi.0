Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EDB3D9029
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 15:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535080; cv=pass; b=kKDwa5fEEOaM8DKeDRl7wcxsnrwh7f+sKSzIRLO95Or6dcOjG93B6krxrUyu0jSRd1V1SBuCpXqf40qdbJchb4PAbmf3yZEbyfY1zU/U8YrV+xEszguStbaxf2zcMn/TkdmldHWwS2cS9d1AOVCSyxldf43wqLKECSX7QAqQwVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535080; c=relaxed/simple;
	bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gyfc4TQvSBoXUXvUQ/6KjMgn6t1OeatJDZVByVmHSW6cDtxro8Y3HJozHa/pNbOdTweas+eW/Aww2Jl/2jA7kMCjrrHmyT9qXIqpIYk2viqXQb5GfmHLEjJPHPqdYOkgfTpgow0Vdyv1973Wq6Kll7DJJQpVezUyg8+HDuxdHp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jK90mMsH; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jK90mMsH"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so818841241.3
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 08:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788535078; cv=none;
        d=google.com; s=arc-20260327;
        b=KC6nDObZLzIqCantHG/mMNpOER9PUoQweIaAZEcPaX719s9dyQzAmTWXCXwJpsGoZU
         GCohhchvHXkvgB3kAQiBdSzy8zpnMlUQbnIw1bztp+Qnc3oCRoflYTcxl8soc1h4ODbY
         H2918uBotkebcjycA00V398jwOyk6OrjhZPM5UrSaK6gxCKXkBmdpg4HXuyOyvIakuYg
         MT++aNLwZMEbEbD9a5GQ1sHPwNTwxCqUqAdELw4Z2GqxGr45PryBcm8b5kZ8wW07jTkg
         KGDXOYEwAstEAIlCkAT8HaYZf/3tr8Ah2a6pO6vUdC6hT41wHxg1M3ig2/WklmqjbQZt
         PG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        fh=WhVn8HHgNzasouCZppst6FPCIsA7aFOXNSCUs7DJDA8=;
        b=cva5L7Q1SsiGav39GZI6WH0gbPDUz84T8ETOcsisLfCAYBLuTyTDNwbpXBXhWvONvT
         /WxIQAPD2IOOaHGAdsufwDp8HT+Z++h6VDQcqfI+9gwiXxir7NMMiFuKInIcT7Ni9CmV
         mG1DeVIi4k1kCw4FgFJFV0QTWEQQCEAdrd61L/wnrmZDWyJFwSEkwyOcKjzB7oNTfdK/
         titALc2CqbbAGvJZm9eCNNRV2/O09gXJsLv6CuEy47vtOo0nPiS2Q6c3rkhD0/aF7Nrt
         fLI+XB6oJlP61IuemlqjJFblHRpqEDbqL/Ykp8Eo/ZPAgkjl1EHVRM0BkquEVv416dm2
         CddA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788535078; x=1789139878; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        b=jK90mMsHlZLBKdzdxr2SMVDYyrUdyyR87zQvXKO3MWNP7gbXbztsligL6x4TkCmdLO
         a5+QwS3kuf7W7i1fgVpMj0ker1x3gJ23d1caq9+nBdSrEc/mRn/ATlxQ0rVcVfiyVIs9
         Sg6vzaZW1jPy1Ga6z5YglG9l4MwMwocYMp2h9PyCPGxmFA/jZfyaOhsy0ooUURb+YNc2
         a9JKUKPb6Wek/G3IGNDRwzcjf19mGGO/eA9BBMoqLgd8n34B7pe2mlOB5asRuPrwei9d
         VOlc2Z/EOW1meAmPW+o42jddi8DLFmjA0gawTkvjbq/d2388LlzxbNYB+gLQChezurGb
         W2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535078; x=1789139878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        b=WSQZBPsBnflvJEkiaNiqO9nO5Cf0zNFq81kDWV0aHUGUUAONZeVuOXoTLOAIXwmcaI
         0CT+igrLYsO1ley4z3RjUyZtj3rGZoPzsWLOkRDmk5PoCJZo7sWuHMbtDedcr4CIaNCg
         XULnsALGAAAagi14tSycQ2/+9PTGIqOfxPIYZoRcl8/z05qOTDe7/ajohuPJ7E/hp92Z
         /0lRX1umB19wr4zfunAwIXaILIF9nZRRb86/WfAh40pSN7iiNHKQbJKWiBKn0lnFx2Rl
         uEp2Csa/wliTqgAUmE9OwXK/xG0DepvCgrs3r57PFQP3qkAV9wIrWHlRU+jlM5kTBnQD
         elag==
X-Forwarded-Encrypted: i=1; AKwUvByAWU1n3R12olb4Hg5/Lu8CX5CTNQ4zkVgPXSwxvKNQ3W+ULF1qEVLCZjbepHEem1aFLQGsXiKlHawqfg==@lists.linux.dev
X-Gm-Message-State: AFuF++kR9nOpkyzeeOkeYqyFVoC/xRuiSKxkdQYIJ29d+c+7Ei2BJa7f
	N2J4KVZ2CQr9yx5yh8COkvDLnnBwCtFDtS+NGAMfCtnRepBo67SfKsY8+bGzUi1Je4ufj3FrgiR
	fCJImlOhqqbucBUqVg9lnSEJOcd/AVt8=
X-Gm-Gg: AYBFou0UEnmBKuzno2Zmr1szP138BPaCj8wovJRQmA0oYkLwTWFnQP8gUNy7U752EKf
	9EqauJfRBx4Cu0IXDh0doqFWwnsrNEkDcuCsuQkX89Ez5w1uHGDNRHb2JCFtwvjgCRlDnrIAftG
	D2HHN3EN+72yaupv2zCyfKix+Pcunp28fGXCtkaz8T53bgGimZSujxHjSVvKtthbDJOH/PkM7/J
	qbvybFMh51lMCNUAXzglkVXBkPKsL0UIOxCzAl+eX0EIiVzDM/mKujD6sOT81mAPGdSD4FiTOyf
	80duce3l3PoamvFxCCzNgwqAIHa+IdUCdr4h/fI4gL+6AoK+Mo0M2zetNNgRNJIFi+dCToiFg2v
	bGThJr92R5VGnzBJAn7KKqLx/UZBEwTsoHBkyPs2GQAIibp5A6ZT8ZSUstg953mtcia0ZoTDeRP
	BqoVjLoDulgkgnRH8VwUX8hu4K9To8AIR7pjfL5lCzkxtThJb0bw==
X-Received: by 2002:a05:6102:80a9:b0:786:4822:308f with SMTP id
 ada2fe7eead31-78a4a9aea5fmr2343885137.13.1788535077663; Fri, 04 Sep 2026
 08:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
 <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com> <87se3p13jy.fsf@bootlin.com>
In-Reply-To: <87se3p13jy.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 11:17:46 -0400
X-Gm-Features: AcwNN1UP0lhDRhRnmSbud-UU5EERiros9_WN1FPXC7f3fDYdM3_vq5pk0G9NwE0
Message-ID: <CADvTj4oW8Hxv_b5vWM5pbeB3wEO-WoqhLwyinCTFPNR6wTHYmQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:42=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 10/08/2026 at 17:04:50 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > The controller randomizer covers the bad block marker along with the
> > rest of the OOB data. The driver currently compensates the marker bytes
> > before writes and after reads so that they remain plain on flash.
> >
> > Allwinner NAND firmware instead stores the marker through the
> > randomizer. Media using that format appears to contain bad blocks unles=
s
> > the randomizer is enabled while reading the marker.
> >
> > Honor the allwinner,randomized-oob property by unconditionally enabling
> > page scrambling and leaving the marker in the randomizer data stream.
> > Keep the existing plain marker behavior when the property is absent.
> > This changes marker handling on all supported controllers; the H6/H616
> > protected user-data placement is handled separately.
>
> But I think the reason why this has never been done is because it just
> breaks raw accesses, including the BBT reads. I don't think this is
> handled, is it?

From my understanding raw access bypasses randomization entirely.

When writing the SPL(which does not use the same layout) we use a
pre-randomized image.

>
> Thanks,
> Miqu=C3=A8l
