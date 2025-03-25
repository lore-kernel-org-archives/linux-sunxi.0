Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66092193062
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Mar 2025 13:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742907864; cv=none; b=BnSXmgioh7h4YqYeAKO9pd9+29/4HJu2e7biCdj7zvx8ZBVIeo/zeEzD0aaDg4IKGIgYuwSCha7j1lgJGEgLncbT2xyUK9efGU+oUUSdxZiUI2uiFtO5eZ08RxKoGCiLQVXQgVtSSaNI8ivi42jdObcficWe6it3p+fbT5SRYdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742907864; c=relaxed/simple;
	bh=ytAAvQ7JGlkRy9+sQoqDV7MKxsmXX7OMGSm/op62KLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjsCwZODP7KRct9pOlXYb59EuZ5yaaaNKwg/zQDYqFZI3vE30ME2iwWD0HB1N7zAToKhp91f8oHHfxa+LcH1IWf5v/M/0oaXz9UIiqmxlEjWpnMUke8+mlH0PrkRnIkHpEL2orEIRwthaiIjqnwVoZaYJpXREjpAWkLQgSmagtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Isv2qRAn; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Isv2qRAn"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecfc7fb2aaso17068216d6.0
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Mar 2025 06:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742907862; x=1743512662; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytAAvQ7JGlkRy9+sQoqDV7MKxsmXX7OMGSm/op62KLs=;
        b=Isv2qRAn4CKSwPwSQV8xcl9sev915qU6RSiRfZNPMAMmBx34YqCcl5ji4lWGFAuO15
         jQFDPz/1jvzINhcx3UqQRBkybB1qXW+tSM4+hN6uZirmpWmkkDQ/Da52QWUgE+Wj2DRw
         ukvKeTtfbGpaatgH9EM4ulg9RPl/+1usHOPcBb+94eBaYWAfIjlAXeIVUVs3p6mgPkj5
         8pbUD4ryRuYuGhpT6CIPntgee5jwx/auc8jmZzCdIatucdlK3pipE3FvCcBWYRNqfj/T
         wtrG396MSOFFDHn1ok5VAzgx/4hMqfJhwiv1vhgjNNtsgv2W/OYMlltj6joOH3c4G5Ve
         UAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742907862; x=1743512662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytAAvQ7JGlkRy9+sQoqDV7MKxsmXX7OMGSm/op62KLs=;
        b=cbvkHvQ0aS6UgNNyjOzYEEMN3A+kLVv0b6Ycl8NxvyS9RubzNKBzzoF8+UMtPIXPjR
         r1wfyrq3JolbefxmYjtRgHdQtIO4JlGwVaDV3Bjth6xPLUvjJHrlWHW3VPSRkjFVRQV+
         GkUvM9XrwXwRpgrmyltEPea4joOOhljGh4+57cSxVP2/mzcLSGLbMCBlAgltyEtX57fU
         IYgb59gRii0P8Cxtr9AZ/ob5ATMdtf8h08rhrrTZ21P5+7A3uJb/8x2UrCzL+dpEYpBk
         KBHq9x31MeX+IHEUl7tkP85SUYk7huLfYp2OfCh5KCcxvDTc01avVgznzIYmj0bCnBNv
         ygCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUqLC5eT43Xr/BtHpT1Vt/zsp+aonU3U50mnfsw82hASfmEl4taYbszLRjG+XVaXxEfPqNYI/3zYpKOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDJX5u+w+113z8o1TJkxEJVgAVpBj41pNhJLVyOiyRTp5YThMC
	LbwQDWF4fYYaq02gnc/4jd9T1VfsLAF93iltQm+dyvqj6mzMWXn4s8T+5W5nlXjG8qvxp3o52Xg
	tXfLd0usHid30SwbTsq92WZCXXmo=
X-Gm-Gg: ASbGncuJO7YRpgfSK6FcfohnEzuE6O1dsAWjQ6QnSKx39Tw8V0w/TFe6KUam8AEv7zm
	YhhP1gPXRIb4pogWa5DjGyU5GRRrzmemHGD2gvf/iL9tJ/nljZjDzIhFN6eRJi6tRF/g1WGloK7
	rh6301eDPb/9NgWn6dHyzqDQL0/g3ge2dfB2V45sZcGw==
X-Google-Smtp-Source: AGHT+IE51PXGLgkSnQJ98M/ddGNci74PQXWvqk0kA+jVT/PXCPMy/JwdbENsPVcSNY10HlA73yPF/yQqtOeqqz2rqvE=
X-Received: by 2002:a05:6214:2607:b0:6e6:61a5:aa57 with SMTP id
 6a1803df08f44-6eb3f2937ccmr297309616d6.14.1742907862103; Tue, 25 Mar 2025
 06:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250324172026.370253-2-csokas.bence@prolan.hu>
 <92772f63-52c9-4979-9b60-37c8320ca009@web.de> <7064597b-caf7-42e2-b083-b3531e874200@prolan.hu>
 <7332ccd2-ebe6-4b9d-a2ae-8f33641e7bd4@web.de> <7afcbbee-6261-4b2f-be14-a3076746d53c@prolan.hu>
 <26e36378-d393-4fe1-938a-be8c3db94ede@web.de> <CAGRGNgU7t85oG3Bq7L3KjKUAbRyd6SHSM6F6BvmdXDVkbNegKg@mail.gmail.com>
 <bd7b31d8-be25-4dbc-9a81-4b0cccd64798@prolan.hu>
In-Reply-To: <bd7b31d8-be25-4dbc-9a81-4b0cccd64798@prolan.hu>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Wed, 26 Mar 2025 00:04:10 +1100
X-Gm-Features: AQ5f1JoI1ggKA9Gw7ELv7T2TUC8A9SzwWIQijK61-mP9ZJ-R-qeFWsNR8IL_vmU
Message-ID: <CAGRGNgVcPRJB+sx_5g-+CLJih4vTWU-FrqiRbvVQ07219WBZPA@mail.gmail.com>
Subject: Re: [v6] dma-engine: sun4i: Simplify error handling in probe()
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Cc: Markus Elfring <Markus.Elfring@web.de>, dmaengine@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bence,

On Tue, Mar 25, 2025 at 11:39=E2=80=AFPM Cs=C3=B3k=C3=A1s Bence <csokas.ben=
ce@prolan.hu> wrote:
>
> Hi Julian,
>
> On 2025. 03. 25. 13:20, Julian Calaby wrote:

[snip]

> > Bence Cs=C3=B3k=C3=A1s, (I hope I've got the order of your names correc=
t)
>
> Either order works, Bence is the given name, and Cs=C3=B3k=C3=A1s is the =
family
> name (surname). Hungarian and Japanese order follows the scientific
> "Surname, Given Name(s)" order, but commas broke many tools, including
> Git < v2.46, and b4, so I switched to the germanic "Firstname Lastname"
> format.

Thanks for that, I'll try to keep that in mind!

[snip]

> Lastly, to all other adressees, sorry for the spam. So let's end this
> meta-discussion here and keep the rest of the conversation professional,
> reasoning about the technicals.

And this is why I was so hessitant to step in here.

Getting back to that, your patch looks good to me and it's awesome how
the devm_ functions and their frends can simplify things.

I'm going to point out that this does swap the clock enable and reset
deassert, but I'm assuming that is harmless.

Reviewed-by: Julian Calaby <julian.calaby@gmail.com>

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
