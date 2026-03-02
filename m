Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF932313550
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Mar 2026 18:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772474604; cv=none; b=sEsWShXxOLo62VrIQfARqI+BrQsLDfW3UGSw3yADM5xNs8+dTfcFjWpAAIPXKWwW0NjkqB9x0cGeyVEO9zv33+huv9ZsWiek14skqvp0I1xTI/2D7RsdI7XY46gBGpSSEc77YuVINq/i5P6ekLGTjVd0KNl0W8bFVxU1JVHBGjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772474604; c=relaxed/simple;
	bh=KYTmWdCkzi4ZeFomh2vR1ikSgEuPoY2tyFbdDD9n6fM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJ8XeotqTtgn2nedvFV5vUewAOp+j2kxN2f/u6frz7dBUCg4jC2wv3lUEfkJsPYbfikXF0NKcyVthuq6Wf/N6dIeMe+23b4MEL8cnM1G5YG1+WdkfSY6J5MGdoRyiG0yI8avvryNn8cfKg48E4oYILZuPxqxXY3mxjPEr6fl8Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZSp+ocW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZSp+ocW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DADC2BCB1
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Mar 2026 18:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772474604;
	bh=KYTmWdCkzi4ZeFomh2vR1ikSgEuPoY2tyFbdDD9n6fM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=GZSp+ocWQ0JzyJE/JKAbIQ6d9V4nscmY9HENIiTRDNhYqf32RPTvvrOXBOJ/rL0Au
	 V0tq+1aXJpu9Tahvb4BZa9epjIAuurII8ahGS4+PQN9O8AeAWWb0ARzlgXgEJ45/Ze
	 Zt3H+h6G2PN/tqW2wZZfBoNdZ5bXg7HRzH2H13BDooK5AyanDQdvmAM3lQenE5dNW4
	 qHVik3vP/B99mJhk2P2t5lJVy9c14Ob1RYwtxgEryndkIMzru+Q+T2Xn36vdypiX5I
	 0XJEREvvNi3qMd2jTQUKbxkTY/cDkpsScHevNphkemsDIHE18rLO8ZcF02sB8vl6Dv
	 VA3j58+5tRJXA==
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1270ac5d3efso4561267c88.1
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Mar 2026 10:03:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHIb0fCHB+lu9GttApOibIg2GFuGwzSY6EAte/niQD+xxByCDl2lopUIsyzJE7j3xYd5+Of/j1Voa9SQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyELpSrUmmWmh6RtAgrGGEWs3WHI17Loed9Vrl1q3d+aDZ5CCnH
	ItOE1sostTXKrqTbdwBYotmJ7Vs9FwBn+rOELoK6JT5AoiZz6a2LwOkiWYrwIWUFTSXn0sKi8j1
	uTUrFZWIScx2M5w7rTCGG+d9Mmku0wAz2Ecn1aABfzA==
X-Received: by 2002:a05:7022:6624:b0:11b:b3a1:714a with SMTP id
 a92af1059eb24-1278fb78dd9mr4239860c88.12.1772474603495; Mon, 02 Mar 2026
 10:03:23 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 12:03:19 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 12:03:19 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aaHI_VavZugXjVoL@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com> <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com> <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com>
Date: Mon, 2 Mar 2026 12:03:19 -0600
X-Gmail-Original-Message-ID: <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
X-Gm-Features: AaiRm5300NChK-leJ7j5rh6yPxkWOdKqgHQ-hP_JtNKBqi3Lo4LpSjP98XQOjgM
Message-ID: <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Johan Hovold <johan@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-actions@lists.infradead.org, linux-media@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 5:41=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Fri, Feb 27, 2026 at 04:42:09PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Feb 27, 2026 at 11:06=E2=80=AFAM Johan Hovold <johan@kernel.org=
> wrote:
>
> > > It seems all that is needed is to decouple the struct i2c_adapter fro=
m
> > > the driver data and have core manage the lifetime of the former using
> > > the reference count of the embedded struct device.
>
> > This is a weird pattern you sometimes see where a driver allocates
> > something and passes the ownership to the subsystem.
>
> It's not weird at all, this is the standard way to handle this. We have
> these things called reference counts for a reason.
>

I wouldn't say it's *the* standard way. There are at least several differen=
t
ways driver subsystems handle resource ownership. And even so: the fact tha=
t
something's done a lot does not make it automatically correct.

> > This often
> > causes confusion among driver authors, who logically assume that if
> > you allocate something, you are responsible for freeing it.Since this
> > is C and not Rust (where such things are tracked by the compiler), I
> > strongly believe we should strive to keep ownership consistent: the
> > driver should free resources it allocated within the bounds of the
> > lifetime of the device it controls. The subsystem should manage the
> > data it allocated - in this case the i2c adapter struct device.
>
> Drivers are responsible for dropping *their* reference, it doesn't mean
> that the resource is necessarily freed immediately as someone else may
> be holding a reference. Anyone surprised by this should not be doing
> kernel development.
>

I disagree. For some reason, you're defending a suboptimal programming
interface. I'm all for reference counting but mixing reference-counted data
with non-counted is simply not a good idea. An API should be easy to use an=
d
hard to misuse. Given the amount of issues, this approach is definitely eas=
y
to misuse.

I'm advocating for a hard split between the subsystem data (reference-count=
ed)
and driver data (living from probe() until remove()). A logical struct devi=
ce
managed entirely by the subsystem should live in a separate structure than
driver data and be allocated - and freed - by the subsystem module.

Let's put aside kernel code for a minute and work with an abstract C exampl=
e,
where the equivalent of what you're proposing would look like this:

struct bar {
	struct foo foo;
	...
};

struct bar *bar =3D malloc(sizeof(*bar));

ret =3D foo_register(&bar->foo);

And the corresponding free() lives who knows where because foo_register()
automagically introduces reference counting (nevermind the need to calculat=
e
where bar is in relations to foo).

I strongly believe that this makes more sense:

struct bar {
	...
};

struct bar *bar =3D malloc();

struct foo *foo =3D foo_register(bar);

// foo is reference counted and allocated in the provider of foo_register()

foo_put(foo);
free(bar);

The equivalent of which is moving struct device out of struct i2c_adapter.
In fact: I would love to see i2c_adapter become a truly reference-counted
object detached from driver data but due to it being embedded in every bus
driver data structure it realistically won't happen.

> > I know there are a lot of places where this is done in the kernel but
> > let's not introduce new ones. This is a bad pattern.
>
> No, it's not. It's literally the standard way of doing this.
>
> > But even if you decided this is the way to go, I fail to see how it
> > would be easier than what I'm trying to do. You would have to modify
> > *all* I2C bus drivers as opposed to only modifying those that access
> > the underlying struct device. Or am I missing something?
>
> Yes, you have to update the allocation and replace container_of() with
> dev_get_drvdata() but it's a straight-forward transformation that brings
> the i2c subsystem more in line with the driver model (unlike whatever it
> is you're trying to do).
>

No, it's not that simple. The .release() callback of struct device embedded
in struct i2c_adapter is assigned from the bus type and only calls complete=
()
(yeah, I too don't think it looks right, one would expect to see the associ=
ated
kfree() here, right?). It relies on the bus driver freeing the data in its
remove() path. That's why we wait until all references to said struct devic=
e
are dropped. After your proposed change, if your new release() lives in the
driver module, it must not be removed until all the references are dropped
- basically where we are now. If on the other hand, the release() callback'=
s
functionality is moved into i2c-core, how would you handle the fact i2c_ada=
pter
can be embedded in a larger driver data structure? Provide yet another call=
back
in i2c_adapter called from the device's .release()? Sure, can be done but I
doubt it's a better solution.

Bartosz
