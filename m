Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AC823CB
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jun 2022 11:22:00 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id o73so5639454qke.7
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jun 2022 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xTsthcJVQmhF7Xm+0URj3QnPKdLx/8RaDMYR7w133tE=;
        b=ZOewfqDrRLi/wwwz9ymLuAwvXjjYy53E3ClhFkvNdW+qY5vw0HCyp+up9VCzwFAaYC
         TMZMyPxvNTz3csXNIdbs8rsyOHKUCVlnSamtOkI5F6E+zyV50wpCEXQvwX3Vchoobyi7
         oEFLlmugJIZbBqnAwFBO6Jj70E2UYEMPY4tyZ6RIl1lE7paHygqQJIl3SXwoKeKrBZYA
         jB8JdfEshy0LTf9aQq+lrbp36yS2ywNM6/WARXiQodcjG0/HrurVUVIChqTOmFDB6oPq
         1W/cgapZ8twK+qTRv/lhZly7yjV0TCgOfRUkFeaWIQg0kk3I6VDhSs8SX5kgj8n9OUBC
         fFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xTsthcJVQmhF7Xm+0URj3QnPKdLx/8RaDMYR7w133tE=;
        b=rN3mVCiLA8qmTUOHTAFDsfvB8zqKyl/Xl1S+4B6/gH9IBDwWLpg28gwu3EJxLFo63U
         z8b+CQJVPDO3IkIIPRVYe7xwQc9PpiVVGw7GeK7O3CQW61dNXrFXX17BxS4kGlF4GROH
         ZRDw0kiXRcQ0fg9aJm4AkC0zoo0hd3pJTJaFqnO0LOrwqwM3CFh2FDzT960h8B1YluZd
         pak4K+SnLJUWGLZAQaDkkJGHZyaCnrbTr7wvd9YCea5uWlTxVA30HO5j6cH5XR9FE/W1
         8ToTi6w1GGLapKVeC09wVdyyKKnXwSI2joaNgWM905+WGav4AJHURB5SHrAniRyUuaZE
         QUQA==
X-Gm-Message-State: AOAM533WKVpzaM+hhe5UBBBjvNdM0L0QF+xZdZ4Q0WDZ61o6kFyqc5AP
	81GIvZECJ9n+uvuYYBXAbe3ursbrMkNeM/d23YY=
X-Google-Smtp-Source: ABdhPJzzrtziPOS1KJw58ikyVeRSCTJtL+zJfPSfWpi98XNxg9V5/7ZCr1rZWPNC30U++ZWvtfSeh1uxvMfo6LMcU18=
X-Received: by 2002:a05:620a:4310:b0:67b:3fc1:86eb with SMTP id
 u16-20020a05620a431000b0067b3fc186ebmr14966019qko.495.1654514519340; Mon, 06
 Jun 2022 04:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220605154731.17362-1-roman.o.stratiienko@globallogic.com>
 <4714286.GXAFRqVoOG@jernej-laptop> <CAGphcdniPFdqgLcpUc88ak9GzNaCvmj_TDVYTOe2bXto-Y12FQ@mail.gmail.com>
 <20220606092006.4bgxibmayv44juox@houat> <20220606092225.yxyw77mtuqpbmd35@houat>
In-Reply-To: <20220606092225.yxyw77mtuqpbmd35@houat>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Mon, 6 Jun 2022 14:21:48 +0300
Message-ID: <CAGphcdmFyK0023cW=UuUWCzqXtkMNBF4t+9CGR13ULaWseJVaQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: sun8i: Add support for pixel blend mode property
To: Maxime Ripard <maxime@cerno.tech>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, wens@csie.org, 
	airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, megi@xff.cz, 
	Roman Stratiienko <roman.o.stratiienko@globallogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

=D0=BF=D0=BD, 6 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 12:22, Maxime Ripar=
d <maxime@cerno.tech>:
>
> On Mon, Jun 06, 2022 at 11:20:06AM +0200, Maxime Ripard wrote:
> > On Mon, Jun 06, 2022 at 11:17:20AM +0300, Roman Stratiienko wrote:
> > > Hello Jernej,
> > >
> > > Thank you for having a look.
> > >
> > > =D0=B2=D1=81, 5 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 23:37, Jernej=
 =C5=A0krabec <jernej.skrabec@gmail.com>:
> > > >
> > > > Dne nedelja, 05. junij 2022 ob 17:47:31 CEST je Roman Stratiienko n=
apisal(a):
> > > > > Allwinner DE2 and DE3 hardware support 3 pixel blend modes:
> > > > > "None", "Pre-multiplied", "Coverage"
> > > > >
> > > > > Add the blend mode property and route it to the appropriate regis=
ters.
> > > > >
> > > > > Note:
> > > > > "force_premulti" parameter was added to handle multi-overlay chan=
nel
> > > > > cases in future changes. It must be set to true for cases when mo=
re
> > > > > than 1 overlay layer is used within a channel and at least one of=
 the
> > > > > overlay layers within a group uses premultiplied blending mode.
> > > >
> > > > Please remove this parameter. It's nothing special, so it can be ea=
sily added
> > > > once it's actually needed. For now, it only complicates code.
> > >
> > > I would prefer keeping it if you do not have any strong opinion again=
st it.
> > >
> > > I am working now on exposing all overlays, so it will be needed soon =
anyway.
> >
> > KMS assumes pre-multiplied alpha anyway, so we shouldn't need a
> > parameter to force it: we're always going to force it.
>
> My bad, I got confused with your other patch.
>
> Still, I agree with Jernej, if it's not needed it only complicates the
> code for no particular reason. If you need it at some point in the
> future, add it then. Otherwise, it's hard to reason about, since we
> don't know what are the expectations that those future patches will
> bring.

Well, existing code already has some sort of support for the sub-overlays:
For example 'int overlay, ' parameter is always 0, but it still passed thro=
ugh
the call stack. Therefore this patch is just aligned with already existing
traditions to keep sub-overlays in mind.

>
> Maxime

Regards,
Roman
