Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793139960;
	b=HZhzcvZloWVoPndPgnuYBHZVh+/mGi9SVmiASnYhj9xtuCIxMmX5KaXtSCUvMhDOB0Hp
	 ZJT2u5XbQ2boS43K996gZhSG3zITEp+sF+h1EIbkckHOgcQQFPhAMFO0U0T4yvPacXCqQ
	 1pmki32kCke20ZzrQ4QL+wYU6awiwjvIay8DIn9+ywCh1VavX4gN6kfajRuf6nP0B6zKx
	 slRGCOts6UDtaMIvK4FjPDCjNs4TJvcHrFkspdP/DJp9Cd1/krRO43aOOB4exTfSdK/N4
	 /QKrXrl3yJe/9671rHt0+cEOzwhxUXfQGSApkEMSSxGWqXE3zwsTgA/nNrjOISVZIYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
	b=GHbYpsX7AsBfhnrix/NEn20ix0doNtwMo6+1NoPbkT8+D9qlHQA6nF5HQyeq3uf5tTFG
	 1lxKqs8D0wN06DPCbyXGvirffinb3YeDugelnHSHeQainYZ6fD45yksVuFdLdlLWd1IOt
	 6QnWnPsOIVzgmHjgG3clC7WQS5eEDAOPIH6cbbhLDe9z+OjI65YNVYlXnZsqjRQpHqG6H
	 ZXRdU9ENhre37DAapRdhLCLM2N+A8pnvQeDZRjSb1EBOz52q+e8SwFgcPjWEwp5RO9UB6
	 SsI7V7yY4raHZtc32MAuasYXTLSydhY5geHMbreGgDVoafdTruzHDmXY2I1ngNMUKlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L/fFVnEG";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3290D606A31A
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 22:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3290D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L/fFVnEG
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eafa528803so166803e0c.1
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 15:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793139959; cv=none;
        d=google.com; s=arc-20260327;
        b=lXiuyGLrsJIxMQ7ajzpYtPnh1NLS7vlAj0z/oNJwc/h6jJ3lFTj7x50SmI+i6Jmh4k
         5Bv9Q8kIRK8s6d90IC6Y3VNfEacCESIUs56NluYOavZouS+1EFkJeU79sfkndqY6Rfa5
         kK7e2O1YjxaQ0FRpvKhBbUHf9kWLGwcjWI0vcbzD5Ww6qXnOFZiI39dtWAvvJdziP/hn
         m6zqjgF0YXCnDUml6NAWp/7QuRzVySLcczsGliBaGoetcCWRgEzvdATqn5Ga0d45aVSD
         DiKfYEErmD1AVFBsU1HEOPaDpScJekFrm5DLbH9RG6pU3HXLbIBRb/O+d8JIyXQbxJoU
         dRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
        fh=GOXMsnFTwdzCTghdtNlz1KsTF1k6hNOQIAcx+nOHfQs=;
        b=ZCXaUgRqNjP0XWqdSeI0BotB2oJehS2ShHmAn7o7VA9p9DPryHczeOqjO5S+6W36pi
         dFcV3uxB3CVoHOZQUuqGbqlVAQEuEGWrAq1WAsTBgcrgC9UsSdKZavqfYmNKlsksKMER
         FKiIklhJ6WQcpayJN6tPqrcBM7ksNAB5buevQlW3F/csnSlWrjFHmEpzQ6NSjIm+xFjk
         4ezkBnY14DvMNHfbgcErMClkVGQbdi0+stHEzFbHqf/Vg97DvUJEHsFO7beGcDaaeNCX
         cG1h5hHX1rA4MlNVgPDyW7PLl0vi+O7h2FJ4mgAgXjTpnjsT7fUpnpvIh5WJW0sHaiGN
         acCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793139959; x=1793744759; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
        b=L/fFVnEGVqawZ0Q7fwnvbc4wDvobjawDrjm5M59l/0KZAcVXuK+EYlsgAvqLHmEAdp
         nMJYuynXj7SzeqG8NyblVUeutxCyjSmgUQs/mETUcDjNhewtdsg3XeGKP8RdRmp3vFIr
         Ot3CxG4F9fYbXrr/4/CkRiBcPUpKtN8nRWF++wCaqjQR4io591ICbPQVW2QME+Hs+98T
         gcmUsndDdRP7Gdx4hA50BkUUmAQtYEzcHvdSsJfqP9C0Mi4YvKoCIl4fqG/9nGDCV1si
         lCPiffRZ6knWruV3/VEvtVZgCOPBxb0nvTdOOarPRTkwj4YERbEjlQ6oAdKCwoJ46mhq
         xLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139959; x=1793744759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
        b=emZIOfVcu+pNxISntKQZU0vFYezLLebKtPG4sl+XaG4N68MvKhVJJzjzKfHMRojnHt
         1POkMECoGXdxz/5uCw+kgo27TtO7QhyNSTvwgKiLKZ3gO2HzQfgKlfL3Op+nTQYxm7KN
         EmCvhZ7o0eqmvln3dlnXpNK2PDZZNoWEwNRAf1QGGfp51QPRaC/FscDsg9gNEVh6WbGQ
         MrXla1xjuJ1+dZ5DK9Xb7MQKu2RMTgLAW7b8K2Rz06VPyIxLoqXIWIN4Oe2VPkwFPIC3
         KYhiM0Q6T/eqt3C4LKeQUj0CeiuWKrxZ+M7j490XfkvPZP+vrE1aOuCpuYpesUH19RFQ
         tlmA==
X-Forwarded-Encrypted: i=1; AKwUvByT3nqWhN5FvjkcYTQubd/mtiPXnbSNQrUMBFTLdeVBgC+/u4R5wJnL+ncmZlyvZvbgtKNQwCcdx8V+KA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKsD1wawdrPwODa+xNX7OSl9klG9RGcF3dv7dT+qlH8xxEmQQD1
	AV9ybOPvn36NFDNUOKTlOHbWe97i57Jgxgy6Af4NnKC5oYmLrVnZiY+7xtmCHfcBxJLRlnJwbzk
	QunkcAg8z71nQq0goETKn6/kfKAqVLVw=
X-Gm-Gg: AYBFou23SVMXgVyJwVYehUmlJ9HVKwdEZzODJoriuBy2sYalCJw/ENpG4J2AcnOuT56
	GEz0lTEQA7IE3fgLY87WYnumdoUsqkYs1r0WlApm74Se+f7GGENGefiqvfpjQwgZ62oayN77UQE
	+w/pNcOSu9sHG6mgIxfMEGjoFcEHMOIgoJEgFycAHxs4M6o2PYC4DskB7ohDwsQfa4Xb9gAohCZ
	TYQC6jUK+TapBJgvEmkmRwiCHRNbd9Ib2dZw26ZGQRQf1E306+IgYiP+ULlp4PKdmuG0lz1EHvv
	EbkmX44eljr3nuuGqOUe6T/8PP3inTgKZtc0UAwJcEYVsuB+ledWfEv+EdEjKygA40r5YSUXbdi
	wndVmLyUCX702XZWcwE4IshryR/sgm2JY4/D6Hy8l5A+kebKATlkK0Tgi+p1xkyg7BwMBCHwdBP
	IP8NhVDOlM36Zbj9kNVMe+/fCrKi0OsQl+pyX/rwxlEhWN3lvt1qW6nDmbBevqY7KXWsXCKby3T
	f+EM7jhym9PKrTLto9d4xyNoFbE2A==
X-Received: by 2002:a05:6122:6602:b0:5ea:c727:11fa with SMTP id
 71dfb90a1353d-5ec4c932ademr347091e0c.0.1793139959098; Tue, 27 Oct 2026
 15:25:59 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com>
 <20261027-nifty-reliable-octopus-6cbac5@quoll> <CADvTj4qrBYSyT39=xK3_oGgHdFoSH=oyDvTtLCSzW=F9KAgi3Q@mail.gmail.com>
 <3287a7db-fbab-4b23-9ee0-d40c52fe855a@kernel.org> <CAGb2v64Qr-XCRdgi+RNS2XkKUn=F8zW+8WUKaauM2PjzL2XgWg@mail.gmail.com>
 <18f1e637-48de-4962-8a13-65f6597eb2dc@kernel.org>
In-Reply-To: <18f1e637-48de-4962-8a13-65f6597eb2dc@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 16:25:48 -0600
X-Gm-Features: AclHuK8HgBo8KQle8selMQ5AGJ_mUpjdczBdxOIx6OfVD5T9FzVHNBxWX4VKWiM
Message-ID: <CADvTj4qqwC=HjPmsdHoZdNNWY8GN8TqXnQG9PqKD-GpRZo11Kg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:05=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/10/2026 11:02, Chen-Yu Tsai wrote:
> >>>>> +  - if:
> >>>>> +      properties:
> >>>>> +        compatible:
> >>>>> +          contains:
> >>>>> +            const: allwinner,sun50i-h616-uart
> >>>>> +    then:
> >>>>> +      properties:
> >>>>> +        fifo-size:
> >>>>> +          const: 256
> >>>>> +      required:
> >>>>> +        - fifo-size
> >>>>
> >>>> Why do you require fifo-size if is const? It is implied by the
> >>>> compatible.
> >>>
> >>> H616 has a fixed depth, but other sunxi integrations have different
> >>> depths between UART instances. For example, D1 has 64-byte FIFOs on
> >>> UART0 and 256-byte FIFOs on UART1=E2=80=935.
> >>>
> >>> Should I keep this explicit for consistency for all sunxi uarts?
> >>
> >> I am confused, there are no other instances here.
> >
> > I think the point is that it is going to be needed in the future when
> > we add the compatibles for the SoCs that do have UARTs with different
> > FIFO sizes.
>
> Then we add it. We don't create code which is not used.

On further investigation it appears the sunxi boards with UARTS with
different FIFO sizes might all have a register for reading the FIFO size
at runtime via FCC capacity bits so I guess we might not even need
a fifo-size device tree property for any sunxi boards if that is the case,
not entirely sure if all mixed FIFO size boards support this however but
I have yet to come across one that doesn't.

>
> Best regards,
> Krzysztof
