Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DEB72
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 17:35:49 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id y5so35696603ual.7
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 09:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=LNSjwgPBAW69tYr5ppeJRmtuxxe2teojG1+3mTlzbk8=;
        b=vL6F6Z9eQO0jv5sTwWgN8gIvJD4DN2cNBxTAtz42sb/zve/HoZ6LhMQph9GYRLs9Xk
         9kiXr3DdYBF+MD+PYpe1Jy8fo5u7FSEkhtSnrn83Lz7Xc7Fptb+SgJc4NTXSdbCrLGmj
         Xc5vs/UERBDfLEkycxe/fZghnC3jLVd2hmLElVxMP4AZy266Akd3PUQXais5Nx6X2zXo
         KbBrw/LNkX3L537C8KKRxup46awaIZrFZ4BNm6VbmfEbCdyrm1uw6TC3mBReBK7CVFFA
         3CBrD87LG2MeLftvcTO0LibFJMVRtqoXLDPjdn3Wf7e03NnB+Z/Lxxc/ycYOFiu90D3k
         6uDA==
X-Gm-Message-State: AOAM531EuFbiZgQ+RhG6xrz9K059OHeH1i53vG0qyPj4VLFEg1nG2oGm
	DPc6Fcls3OFkk0E5pIn4PJn0ATkuACSqCA==
X-Google-Smtp-Source: ABdhPJyRBx8JfGF515RHSfX8t9eXPJkD6X/1No2foOAoDk6nxYklYH5hJ+Gj7zQEqZQTh1EH0iViXg==
X-Received: by 2002:a05:6102:511e:: with SMTP id bm30mr34665148vsb.48.1638207348174;
        Mon, 29 Nov 2021 09:35:48 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 66sm9119007uao.0.2021.11.29.09.35.47
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 09:35:48 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id az37so35667233uab.13
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 09:35:47 -0800 (PST)
X-Received: by 2002:a67:c90a:: with SMTP id w10mr34928412vsk.22.1638207347791;
 Mon, 29 Nov 2021 09:35:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211129165510.370717-1-jernej.skrabec@gmail.com>
 <CAGb2v67M2Qi5tUq0BNbgahTsY4bbYGQeqzjoH8RZ6fYWzrWsYA@mail.gmail.com> <5516984.DvuYhMxLoT@kista>
In-Reply-To: <5516984.DvuYhMxLoT@kista>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 30 Nov 2021 01:35:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v66ZGMxqgU7sGrSrnog3yHZ+Ny_xJdvBFVYZWH2Q5XbiCQ@mail.gmail.com>
Message-ID: <CAGb2v66ZGMxqgU7sGrSrnog3yHZ+Ny_xJdvBFVYZWH2Q5XbiCQ@mail.gmail.com>
Subject: Re: Re: [PATCH v2] ARM: dts: sun8i: Adjust power key nodes
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, Michael Klein <michael@fossekall.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 1:29 AM Jernej =C5=A0krabec <jernej.skrabec@gmail.c=
om> wrote:
>
> Dne ponedeljek, 29. november 2021 ob 18:16:31 CET je Chen-Yu Tsai napisal=
(a):
> > On Tue, Nov 30, 2021 at 12:55 AM Jernej Skrabec
> > <jernej.skrabec@gmail.com> wrote:
> > >
> > > Several H3 and one H2+ board have power key nodes, which are slightly
> > > off. Some are missing wakeup-source property and some have BTN_0 code
> > > assigned instead of KEY_POWER.
> >
> > It might have been that after shutdown there was really no way to
> > "power on" the board with these GPIO power keys, so we didn't use
> > KEY_POWER for them?
>
> KEY_POWER is actually processed by userspace, so it would still make sens=
e to
> power down board if power key is pressed. Correct me if I'm wrong, but in
> combination with wfi it could work before SCP FW was available?

I guess it could? But where would it do wfi, and what would execute
after wfi?

IIRC the kernel's halt sequence doesn't really clean up interrupts,
so wfi isn't going to get very far.

> >
> > > Adjust them, so they can function as intended by designer.
> > >
> > > Co-developed-by: Michael Klein <michael@fossekall.de>
> > > Signed-off-by: Michael Klein <michael@fossekall.de>
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Acked-by: Chen-Yu Tsai <wens@csie.org>
> >
>
> Thanks!
>
> Best regards,
> Jernej
>
>
