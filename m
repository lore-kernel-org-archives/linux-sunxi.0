Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831F621FF4D
	for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461555; cv=none; b=oafmBpVi7lWZOP89TRO2nM453LYnbvM3sgwOT24qrgudSHNSvgBNQfUpTJwYPCyhVk+YmnR00V9yR81XJzXsoCaVMyVxIr0i9EOj6M/B4jTSe872igzv1ltjFqrsGWDGxGCesWngkld1tDLCMsv/8vU/NjNQl2mCygsQcH7Owrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461555; c=relaxed/simple;
	bh=2WYsfpi4i8f0LBMEO0DT617i14NhS7BPxw7WwiazOec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbF4PJslkUX4JwXsztHeOdayCBPsY79dKP0CeBI6y95YFY9X1pi6QZ7HcaVqs3aUdn2mIHpuL+wwwtMXF6IyDG+A/OnbyD7DF7ChiPjPuSlgpe8vBdDofVyrmqOSNFEBpZhLO/8yV0ntE2zHkEpaE+9bXAhWNNr/cldlDxygWvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsaT6zEM; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsaT6zEM"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87dfabe9272so34552241.3
        for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 12:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748461552; x=1749066352; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WYsfpi4i8f0LBMEO0DT617i14NhS7BPxw7WwiazOec=;
        b=YsaT6zEMw82X8Dqnmqtd7v9/a/9DmzavFbIRbuQZQqrWxqfC0LrOnnbVSMkrmpTY7f
         F3Wax1j/fe4U7uPRRlU9bTLlCoQXXrLXntn5HxFdUqV7Q+OtAz/cDHlsWMNUhdJI1AFP
         cLDbBBKDKiFQRBE8ZVV3leajVth1cqnULiKWelPJsU8MQSAQcDVbh0+gNEwTm9t+/W3a
         pDn544/IiOQvV+RcJVZ5VJ1G45mESzO8CW6gmy9Yts0iu7HeNbN+5xtEnK/WNh2n/p8c
         BAxFd02aXoIlGdDe+2oRbEcVohE7DfrisKMLtv0VgN7PFNGaNPPp/QehMfkd92qM5O25
         RC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461552; x=1749066352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WYsfpi4i8f0LBMEO0DT617i14NhS7BPxw7WwiazOec=;
        b=hXgjYbZQI5oSqvByYfSSdaeTEPPYJBwFODRDSwKhRxjHFG9yI2cuJzmBcW3wMCTmzo
         EsScWBzgUOCs3AHt4O9LIR6pBPUzQeh0ln0O0O8R1PfV6c+oNLZhnhdop4F+Wvybc0E9
         QGuoGsR5obEOZYKFOU8PfK5VqH81qCk+wCnQ5FTT7iXPRFW9yINLRIg9+R347byM39W4
         3qkO4hf4Ps3aHvH3dd8KbuXpyePX1U0x1CbOYPIoDUg/RZGDw5Td/G2Cu1IAhKGpqU7R
         Fag5zMpTKkLczAaavHBBWHT7vOMi7s874ul6y4D0Bac3wbN6bWysKIdVWK4JNqf5N9e+
         LMZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1HYRog+dZyzYGedOfdkqV6vi07mFGExPiQIshZ8ZL8ZLAnH9HfC420xLDLD+ZCyA5CKtPdr5ADswjHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwtamjzmP4QbAmbMILHODkdoaWVCWU+b15uFjLG3SvsLdc6JZh
	N3fD8uxXkfVRulcQVQnzIfW6Q8y/WtWxIFd0kNhNCRYleYdZBCa0m8S4VpCFs7zszxFOB4RdGMS
	iQatyFoZvu3J0LuNoinxsIbFskvF1ZBk=
X-Gm-Gg: ASbGnctQyx8hBqABLmPEFWMZf0OzUYvX9g35N6jV3Op75IYYIN2HRaMVdKno24ShgLO
	kh3CXdLq3L5YTIcmWMMLeB8GEKcEpnc9eOV5hp2Vq8sNYkKD6QouzzGOZ0zyDIvyV2ss5RI/UPd
	jHHInAeM1PIRSn+q8UHQENrp+d63i6eZJbpw==
X-Google-Smtp-Source: AGHT+IEMvKPgfShf/MwU8EBntmzL2gLB5r9MeIt5Zff5sN3Hg4sMdylM4vuXLPE4sTB9F/25CeOcTFcD0aTeNKmZrbs=
X-Received: by 2002:a05:6102:441b:b0:4e5:9fbe:79f1 with SMTP id
 ada2fe7eead31-4e59fbe7f3amr3865881137.24.1748461552237; Wed, 28 May 2025
 12:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch> <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk> <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch> <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk> <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch>
In-Reply-To: <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 13:45:40 -0600
X-Gm-Features: AX0GCFvXBPujHS6_IsJk8UZ1tZBvuuAf4ZznRV1htx1eM1HjStthmVFSfduasE8
Message-ID: <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, wens@csie.org, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 1:27=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I think a lot of ethernet drivers use phy_find_first() for phy scanning
> > as well so it's not limited to just stmmac AFAIU.
>
> You need to differentiate by time. It has become a lot less used in
> the last decade. DT describes the PHY, so there is no need to hunt
> around for it. The only real use case now a days is USB dongles, which
> don't have DT, and maybe PCIe devices without ACPI support.

I mean, hardware probing features for this sort of use case have been
getting added outside the network subsystem so I'm not sure what the
issue with this is as those use cases don't appear to be meaningfully
different.

> I suggest you give up pushing this. You have two Maintainers saying no
> to this, so it is very unlikely you are going to succeed.

So what should I be doing instead? It's not clear to me what the issue
with this approach is as it appears to be a rather non-invasive change.

> I personally don't like depending on the bootloader. I often replace
> the bootloader, because it is a crippled version that does not let me
> TFTP boot, does not have flash enabled for saving configuration, and i
> want to use barebox etc. I think it is much better when Linux drives
> the hardware, not the bootloader.

As you said earlier we don't want to rely on the bootloader(which I agree
with), so it's unclear how we should support SoC's that require runtime
autodetection like this in the kernel.
