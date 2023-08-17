Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289A418031
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 21:21:48 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-58caaedb20bso2811597b3.1
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 14:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692307308; x=1692912108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bOsJhNQoYOmFJimTxaJ2mCEMh67hQeGjwrVTDjEnLSc=;
        b=TPpXhy+K1amcpaItC/ed4ueSEE/vXLBV37L0U6/4TdOwYOXUGHidIxyLeJ855ApD3H
         oDYlcUS74zFmYL6eH28+wHzC9YxLzFs+OpCV2DVcetcWTCbSVQNeYdQGSFK+FThsvMIY
         RO5IXOiS6OvvhxNXyUGeYhTrePsgYMhEgiVMCbzKOjw30Y//ytN3kPRHEuK1kZVmG/AF
         cDjGWNVEwq6K67K+cEVhDcyLj+94WUGZJEtvOokIPU9caXSIRCmyINJElm/IMjvnfEn6
         m4Ju2t6PeSZWlALjduMmSKltL0B3e3YkiXr1p2dLRtCQxbjqWrEkRLaTikMyTyWNS12I
         szMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692307308; x=1692912108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bOsJhNQoYOmFJimTxaJ2mCEMh67hQeGjwrVTDjEnLSc=;
        b=ExVbkFfCmqslt5+HkC8b7TmH4lrkxcZZQtZnZaXCeM+j4Y4YgNwSaPaE3gOof/c5oD
         D/EwApn25aAiUhzZdEhgS5RNJjCD62mDqYwec0JDRgKWoFkxNhlAf9dYpcgpY0YJk0Sj
         TN5OQ60pUXc3rbJnnX8eJEp6d0nR6nTHnKaOA539/P2FMh6Qur2OnjZ0soqXeBYBnGRw
         d85QhLDnjPNDsDCEFdKxJugDrxfVhCwlPhMb9Ludqvw6kQjFhEgMRTmFowI8mfBn16rU
         AnvXdB+Sdm/0PKsh1ZnOdmeNR15i80Y2Tbf3OQADnVWozVyBgyO+gMAD4CFF7QJqgSVC
         9dQw==
X-Gm-Message-State: AOJu0Yz2g0F0IYhOpqFLVTRbdkzJGVrBAVgAhmtTZ8h2bp/50oMOOA0Q
	/wfllQOLoL7sg4hWbMWqhrR6D5LLAEBiEd6Qqz0=
X-Google-Smtp-Source: AGHT+IGQXTWxmdciEZxIzZP/m4iBdXR2/9RjqgCWXFOWD1UKeTLBCsQK/MaM+1qERKqXAU3q08FpBTVkStU29ojPqmQ=
X-Received: by 2002:a81:8a81:0:b0:58d:b9f3:adde with SMTP id
 a123-20020a818a81000000b0058db9f3addemr463939ywg.51.1692307307925; Thu, 17
 Aug 2023 14:21:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGgoGu7Vim82Hu1JKc+m6cPkcn7+WWDFwK5P_YE6grFQS9E21Q@mail.gmail.com>
 <ZNm2ihdTojuPJM2f@debian.me> <CAGgoGu5XuHhVbnrNKBzhZyZH993bBHiLgjTrtyofvePZ-dxLow@mail.gmail.com>
 <CAGgoGu5iTE1xeupwTUUAcJv59294dNQJEf9oUWQKF72hrpFxRw@mail.gmail.com> <ZNwWNopPItNwKCTV@titan>
In-Reply-To: <ZNwWNopPItNwKCTV@titan>
From: Fawad Lateef <fawadlateef@gmail.com>
Date: Thu, 17 Aug 2023 22:21:35 +0100
Message-ID: <CAGgoGu4R2Y5Yj4zEQyekZK0Vkb+XpWg+mudmW3LNmfq3tCFDjw@mail.gmail.com>
Subject: Re: Question regarding Linux-6.3.5 and Sunxi A20 NAND/NFC support
To: John Watts <contact@jookia.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux sunXi <linux-sunxi@lists.linux.dev>, 
	kernelnewbies <kernelnewbies@kernelnewbies.org>, boris.brezillon@collabora.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Aug 2023 at 01:20, John Watts <contact@jookia.org> wrote:
>
> On Tue, Aug 15, 2023 at 11:01:02PM +0100, Fawad Lateef wrote:
> > Hi everyone,
> >
> > Can someone guide me? I am not sure what I am missing here.
> >
> > I am trying to debug the code but I assume that the SUNXI NAND driver
> > is supposed to be working and that something is missing from my
> > changes and additions to the dts/dtsi for A20 SOM.
> >
> > Thanks in advance
>
> Hi there Fawad,
>
> I've hit this problem before and it's usually been because the pins are being
> used by another peripheral already
>
> Could you post the kernel log? It might have some notes on this.
>
> John.

Hi John,

Thanks for your help. I found the reason for my issue. I defined the
pinctrl information under the "soc" next to "nfc" entry in
sunxi-a20.dtsi which was messing it up.

I moved them inside the "pio" dtsi block and NAND is detected now.
Though almost all blocks are reported as bad-blocks.  I am thinking
that it's happening as I don't have partition information defined in
DTS. Do you think that this is the reason for bad-blocks reporting?

Regards,

Fawad Lateef
