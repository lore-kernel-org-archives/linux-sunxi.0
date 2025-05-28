Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438CC283FCB
	for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 11:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748433472; cv=none; b=hu6wfEy7VSLlB/kBVKJMoa7cNADCibBZ9BmSZgrSJh6Au0AQmSzG2RgXWZAl318CvPcY60s4m3pmXJSfbSXvLY6jsMHwautmaXWTytAHWlqXaxs9C2pj3ettQ+gSe73NKJO1wYXAWaNgES01tnSjgr2VxpdSCPszVgB/5GuqlvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748433472; c=relaxed/simple;
	bh=DM2QbUzIiVq1oAO1zYgkeLSN01UQu1uYF+2linnaY0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZH8p2wpy3yTJsXCfu3wmVsMK1mmxMAA+CzwJj1cL1jEt8dKuSkJ9UjzgSV+xm9/kJHs+Z/ZOqtOGNqYfwxQqvIwBQ0xu3z/8VY53wgyJ8he+v/4WlMsl+8iE1xopMqyDL4a4FPO+NkAZpu6FTRXrQMZvX7EKnRyatjh6cwKNMOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzNLwAo4; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzNLwAo4"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e282b9a2b9so584424137.1
        for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 04:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748433470; x=1749038270; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DM2QbUzIiVq1oAO1zYgkeLSN01UQu1uYF+2linnaY0w=;
        b=HzNLwAo42PlhCsOcL/BsTj8X6kCzNryp8BukjwBqHvVZNvyN6q6M7V9mPMjBpBBIxr
         iGKsDu2eZ9E172b36XiEk0uesgjHJMlGdjdegb3NSWqbdwJVjyAJ1lufK8yJIwolp8GE
         wZaU0XuYbR7ELIviX3wtSaUDpOK9wCyXFC5woDRD0az2NVXyJxTmMVGpBN3vCQrTnUVY
         QZlL0BW4rD1KIFUyzrxpIqanMN8BddcepkdRbZL485wlVYqaX6vFOMo8J6/pVeXey9sL
         1peN9PdYpDOMu3NN74/gnZbJIBIQqoeLhqA4NT1/FgLISA4et3x4Rvs5QUJBfQVxXe5h
         DXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748433470; x=1749038270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DM2QbUzIiVq1oAO1zYgkeLSN01UQu1uYF+2linnaY0w=;
        b=VWV1VJcA+vKu+lArwUWTD3ugas99Zd/H77v2OYw9sIAbH9VwNj90EwYS9y++iVnbfY
         k5MFpZh3EPRZ/bCBU56i4kou2WV48uYJam8lP5n8Mr9lsSXrqOGF5N4BVmyRgnydKtkD
         mu6WJVE0jHjiOUW6ccHrQQ8jp50FhgzkelZUoUtN3zlv8VsdyWVdT7Bm9DGU2h2FhZMC
         tgrb9e5MQv7l4QpziR4TGcdQajhinegNS1XqmpuxGcPgyB5h7X9CB0oeHRl+vmnA2+lJ
         +ZrndUkT9ZeM2rgP1W+nICtDXo5FRTjfmU4LjZGqqA+lB7SNaAwNhIshvkKvVcusSRSs
         tKsw==
X-Forwarded-Encrypted: i=1; AJvYcCU8rSzFCa5AvzaT6gwnkiPmteJeYsdn/cyaEKAOZs6hoPdxNbht2PS6NAt6dMQFiZbNJ5E2TiabLJIWgw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvcy49Qklq9mjcjY0fMS51IUxFIUX2PlMdn6+WXG99chkEkWZg
	z/OfZVf+Wc4HU6A/NP2Eg7gipQb6lcrV1Yp6V9K0rro8liwbrEM2ywwXQ3DSx7hNp6GGo7+GFFu
	r8V7rR99TVdp5dWttKBZQuVqRady4XRU=
X-Gm-Gg: ASbGnctDN8QZkpJ78Zhj0bDV9OPCwwSM8/3gpbHAX+swDH4uXHG+D+v8vOGW7Y+lb5m
	VZegNnu/rgOpbHWv++hZie8vljt7YEdfmE5WdD/0sYvMwFTQ2u7DNfimwRbhfzcGOG+5rhEHCY3
	9rw4bNQVIEQThbHhmrbM8YnGNX33zV8IrMXw==
X-Google-Smtp-Source: AGHT+IHccZ6u3wYBlr61chnbgjUWRM+9FVRKkSPAvmULH6YUlgEgMZxUk6AOBWwMA6JVLhM/7o4896YpQLK4HFLW4VU=
X-Received: by 2002:a67:e70d:0:b0:4e4:1d6d:56cc with SMTP id
 ada2fe7eead31-4e597dee6afmr4608606137.12.1748433470075; Wed, 28 May 2025
 04:57:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch> <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
In-Reply-To: <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 05:57:38 -0600
X-Gm-Features: AX0GCFvRg1G8o6RHpRasEA3gbglv1Max4m9hoMAbkTOqRd30AqyfzVMQn3V1-wU
Message-ID: <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 1:53=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, May 27, 2025 at 02:37:03PM -0600, James Hilliard wrote:
> > On Tue, May 27, 2025 at 2:30=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > Sure, that may make sense to do as well, but I still don't see
> > > > how that impacts the need to runtime select the PHY which
> > > > is configured for the correct MFD.
> > >
> > > If you know what variant you have, you only include the one PHY you
> > > actually have, and phy-handle points to it, just as normal. No runtim=
e
> > > selection.
> >
> > Oh, so here's the issue, we have both PHY variants, older hardware
> > generally has AC200 PHY's while newer ships AC300 PHY's, but
> > when I surveyed our deployed hardware using these boards many
> > systems of similar age would randomly mix AC200 and AC300 PHY's.
> >
> > It appears there was a fairly long transition period where both variant=
s
> > were being shipped.
>
> Given that DT is supposed to describe the hardware that is being run on,
> it should _describe_ _the_ _hardware_ that the kernel is being run on.
>
> That means not enumerating all possibilities in DT and then having magic
> in the kernel to select the right variant. That means having a correct
> description in DT for the kernel to use.

The approach I'm using is IMO quite similar to say other hardware
variant runtime detection DT features like this:
https://github.com/torvalds/linux/commit/157ce8f381efe264933e9366db828d845b=
ade3a1

There's already a good bit of mdio autodetection code like
that which scans mdio buses for PHY ID's in stmmac. To me
this is just allowing for device specific autodetection logic, it's
not like we don't already have a good bit of generic PHY auto
detection code in the kernel already.

> I don't think that abusing "phys" is a good idea.
>
> It's quite normal for the boot loader to fix up the device tree
> according to the hardware - for example, adding the actual memory
> location and sizes that are present, adding reserved memory regions,
> etc. I don't see why you couldn't detect the differences and have
> the boot loader patch the device tree appropriately.

I mean, sure, that's technically possible, it just seems like it's
not the best fit option here since there seems to be no real
reason this sort of autodetection can't be handled in the
kernel itself.
