Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3827E76E
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Dec 2023 18:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZTAROQ4"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a1e83adfe72so560226166b.1
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Dec 2023 10:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702404597; x=1703009397; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzHpbohFT6LpAWNTUe1hh6CWPa5rN3o0qmOFe9ThREM=;
        b=mZTAROQ40e2KKmwODXDP+nIrv3gJ7k9mW3M1vzY13rcoq1svIIeG6l19wP6/7vZj8G
         89aaWIb7vRBcWU76V4qw4jldfhsYAV/G5aEvHcHtDBwMQv5acVVCGqTOH8Z8FKfoXGJq
         DT9sfX4QSvXvPiBHBgH1YP+0HPB5527BnonDPMxexYtgp6EkanrH8zMH56JkABAAOF5W
         6tQQkRwe7zHh1Sf5qQfTYP9phyBsYEal5Fvn0+ajFmYNA6jbkf+9G4v/X3hAOEawuFmo
         BIP7JOiKbEjLGJN/nbyhG2KzU6/4ma214AeVc0q6GBKw1lYU80CwWc+BaNuu9MpnKBwj
         Py9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702404597; x=1703009397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzHpbohFT6LpAWNTUe1hh6CWPa5rN3o0qmOFe9ThREM=;
        b=niJa/ItaXNlo9S9aQeZHS7sIZDNFPaMUF9Ne+FSnIOCbcOdKYig3sCiseHzZ/xE2ke
         lAF29RrB35WBQVA7VaOF8nyz0yHrcYe22wCLEPW+LuQ+jim3eYGUse5Y69OzaIDeVI7e
         IrzR6yw+3aHpIsUzqu9WtM5t+SrZZE8Mg+QAcjFIB3NbrXyTEwCBZ24gSa88fsstco8m
         PYnVZ3e0L/5c7hBovUoNWTc/Dnzd/G1wXBUEpiDBCdphW0WSnPr4YRzffOkYPtfuiSPk
         EMz5I+faT1AZJOAY4jl3d/t8LNgoMlYAtbs0SM490xV4j95dDlERpMGECNX+NaYleJ/p
         Ph9Q==
X-Gm-Message-State: AOJu0YxyOgeOPgSXV2xPQHfPRZ6+2GTtDGzMmacoVvkpdxnUoH7p+549
	qsWj5ekmFunzz1G7L8wGzMth1nYNYxfg9hW/63s=
X-Google-Smtp-Source: AGHT+IEJ+S2gVNDukxKxZq7wUSERI+JIQpfaGwh6jo/cYSszkFlbTba+OH3MZMwKSNWFKwcqQo8KEwSOpUZF6Gy8G3E=
X-Received: by 2002:a17:907:7d8b:b0:a17:63b1:42a1 with SMTP id
 oz11-20020a1709077d8b00b00a1763b142a1mr4497018ejc.25.1702404597170; Tue, 12
 Dec 2023 10:09:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128005849.19044-6-andre.przywara@arm.com>
 <a14fb458-caf0-4a4a-b76b-c2503b0840d2@gmail.com> <20231211000528.57cb646c@minigeek.lan>
In-Reply-To: <20231211000528.57cb646c@minigeek.lan>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Tue, 12 Dec 2023 21:09:45 +0300
Message-ID: <CALHCpMjz4YiE_=6Cxq7RqF_3qPaw8UCA=6eLy9ZZuofRhr7mcA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] thermal: sun8i: add support for H616 THS controller
To: Andre Przywara <andre.przywara@arm.com>
Cc: anarsoul@gmail.com, bob@electricworry.net, conor+dt@kernel.org, 
	daniel.lezcano@linaro.org, devicetree@vger.kernel.org, 
	jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, lukasz.luba@arm.com, martin.botka@somainline.org, 
	rafael@kernel.org, robh+dt@kernel.org, rui.zhang@intel.com, 
	samuel@sholland.org, tiny.windzz@gmail.com, wens@csie.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 02:48, And=
re Przywara <andre.przywara@arm.com>:
>
> On Sat, 9 Dec 2023 13:44:34 +0300
> Maksim Kiselev <bigunclemax@gmail.com> wrote:
>
> Hi Maksim,
>
> > Hi Martin, Andre.
> >
> > May I inquire? Why do we need a separate sun50i_h616_ths_calibrate()
> > function? Why can't we just extend an existing sun50i_h6_ths_calibrate(=
)?
> >
> > At my glance the calculations in both functions are the same. We just
> > need to handle a special case for the 4th sensor.
>
> You seem to be right, they are indeed the same, just written slightly
> differently. Do you already have any patches that unify that?

No, I don't have any patches for that yet. But I can do it if you told
me where to
send the patch. Should I put it here as a reply?

> I don't know if Martin or I find time to do it this week, but we could
> also optimise this later.
>
> Cheers,
> Andre

Best regards,
Maksim
