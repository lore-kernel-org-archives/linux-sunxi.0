Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD51763B9
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Aug 2024 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724502892; cv=none; b=i7xkeIeIttgUjcuClL7kMBYMmQtYEg6P1nLZ2Ou2jB/HLm9MOv9v9MO6XYW7bbTR4EGJ/1RKrNhaM6PACLMWKdptzLLbyMTn3CxmSapd3jjfhdU4zM98IDhKXnoJ4QRIzMsB7WhOrg8GlLEwv6Lx8AXguo9YpZvnJADAOS+yoOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724502892; c=relaxed/simple;
	bh=QwXiEAjwEXoAE6zGlVy7wCnl4gDD0wbHdryjStKwejE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M+lrLNJWS9ge3pXuEma0BviCDTzFJ3KxkITkheRfpWnssC3h4sgoGU86z8Gspu9ahxrsGLAwxFQDKNYmIvtj8MCKmOPbS1dd7IkHGI9tsMZuc63i+U0ArRenXHTUYlMzCgFl1FD9ps2/e5ox0HQpFvPIKSOy1K+Gr03q2HvQ2yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f4f505118fso16817301fa.3
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Aug 2024 05:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724502888; x=1725107688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwXiEAjwEXoAE6zGlVy7wCnl4gDD0wbHdryjStKwejE=;
        b=jDLYvL+NQuufwGfMUxu7OyEEF7vzlrhIGSzWmI4PN0HoDoptUE7+5egtBcce/UqooZ
         EPl8th/2vkyqVZHtHTHZgtm3Y/OaaLWr5SZ39zNVlxkSepOmPL21d5rk/Sl4kFBSSt/m
         zAkAIcs8zsf27k3iNiBR/NOld7fGTwOOzvAy43WE0SsCJhixzfx+torVjH8+KeI2WkMA
         uiaaB/zxY3Ja9Xa6u6X/iXOCdUQiEF8krR46jG6ZYWCoomzdsCVUswx+JAs3XHrj2yeu
         oLIapXPx3iQOhuYbvCtg47MxhTHeOE63Ks5dcAdHkRr4ASsGu/sY35V5g/JYA2zAkq3x
         mfVw==
X-Forwarded-Encrypted: i=1; AJvYcCVfiXVVXHl9Qd0rtjteUvMqoZhjqyLKB3iQxKFLR6afrNRhAdX4S1IZq2pXC/K108DZknWNNiRtl1uWow==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXDECUh0tupVwi1bQ6PE3gSeYbLP7hAM3fydr8MEQ9AyIaULDW
	YGv1LRvWcKlbpqj/bjFoYpSI+xC++OpLDhgYGqIUztkmpVTLvDevHDtkBK6c
X-Google-Smtp-Source: AGHT+IHqzYuML1oZ2tVzX499eUgmAHBJoAqm615DCqJwILdOzrCCNXYXXbmeGnaG8ki8+Smv2QXtGw==
X-Received: by 2002:a2e:be8a:0:b0:2ef:251f:785 with SMTP id 38308e7fff4ca-2f4f48d62a9mr37416501fa.1.1724502887087;
        Sat, 24 Aug 2024 05:34:47 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f40487fa1esm7532481fa.120.2024.08.24.05.34.46
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 05:34:46 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f4f505118fso16817021fa.3
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Aug 2024 05:34:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOVhuPN8XXNgvSRkv5JCI6W81q8vrDZbBnDArM+CkjOCbqtiwZKj0FZBG0YbrjhUAjPQu1KGbNdokyMQ==@lists.linux.dev
X-Received: by 2002:a2e:4a12:0:b0:2f3:df8f:bfaa with SMTP id
 38308e7fff4ca-2f4f4927f82mr28693001fa.36.1724502885863; Sat, 24 Aug 2024
 05:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240824-b4-fix-nanopineoplus2-pio-regs-v1-1-7c5f7da445af@gmail.com>
 <761f18d4-9274-4983-a128-94efb96e1c59@kernel.org> <51f28d92-f670-47de-8e2d-53cbecfac081@gmail.com>
In-Reply-To: <51f28d92-f670-47de-8e2d-53cbecfac081@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 24 Aug 2024 20:34:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v65M6Zz7=TfRwF0urbELNaaazMZYsd3dtHYzwdJvzoho3A@mail.gmail.com>
Message-ID: <CAGb2v65M6Zz7=TfRwF0urbELNaaazMZYsd3dtHYzwdJvzoho3A@mail.gmail.com>
Subject: Re: [PATCH PATCH] arm64: dts: sunxi: nanopi-neo-plus2: Add pio regulators
To: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Aug 24, 2024 at 5:08=E2=80=AFPM Kry=C5=A1tof =C4=8Cern=C3=BD <cleve=
rline1mc@gmail.com> wrote:
>
> I am sorry if the message is wrong, this is my first patch ever sent to
> the Linux kernel. I have checked the schematic of the board and it
> shares the same power line with mmc0, so I assumed I can use the same
> regulator. Thanks for your feedback and I would be glad for your further
> response.

So some of the pin groups do have dedicated supplies, and should thus be
described, but not all of them. The schematic only shows dedicated
supplies for PD and PG pingroups. So just add those. PD supply is from
2.5V ethernet PHY I/O regulator supply, so you would need to add that
as well.

The datasheet also mentions a separate supply pin for PC pingroup, but
it is not shown in the schematic. I would just omit that.

And as Krzysztof mentioned, device tree changes should be to model
the hardware, not to work around some operating system warning. At
least most of the time that is. So your commit message should also
be about fixing the description or providing more detail, and not
about the operating system.


ChenYu

> Dne 24. 08. 24 v 9:40 Krzysztof Kozlowski napsal(a):
> > On 24/08/2024 09:09, Kry=C5=A1tof =C4=8Cern=C3=BD wrote:
> >> The board does not have a dedicated regulator for pio and r_pio,
> >> but this fixes the kernel warning about dummy regulators being used.
> >> Tested on the actual board.
> >>
> > Judging by commit msg these are not correct regulators. Please do not
> > add incorrect hardware description to silence some warnings coming from
> > OS. Either you need proper (correct) hardware description or fix the
> > problem other way, assuming there is anything to fix in the first place=
.
> >
> > Best regards,
> > Krzysztof
> >
