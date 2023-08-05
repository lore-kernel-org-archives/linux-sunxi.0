Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91066C2C8
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 17:49:55 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99bf8e5ab39so450289366b.2
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Aug 2023 10:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691257793; x=1691862593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYJH/1P//NwsKipiDkgfl/z4aZz2q+xkqCsqTOu5Bf0=;
        b=j/mPVWvYXvbo/U83l1AGEhWBbnbL5ajrpLlTTSCXbdaJLSvpWA8XqfqCvpKRezoFL4
         GDCsmSuw4dObYIn1NQHIrtO7ZljDdV247wdhWW9+Cpfz688iwYU7cQKJu8T7/HeszQsu
         +gOMBaXAsF7foZDrq8HVld7TYkXDQW+G3tzwyD91WjNo33t6Kge2uh7vGnl85cJX+P2T
         V62JC9p/sXMehHtY70AFIe2oLRP5xx/e6aaK28Uh53j+ytu8bBbd8/iOo+q7pwuDOAcS
         7egsQyG0sDLHfjw1HKaoZ1wV0CIE8QTdpfWHlZNK7w4Krg8Mxi8EMbY2Url/mmGqVuOu
         4Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257793; x=1691862593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYJH/1P//NwsKipiDkgfl/z4aZz2q+xkqCsqTOu5Bf0=;
        b=cxdlfnu0k8HdmbOxpfhstI/jWErEmx8Vmwql4F0zMx2Ig/wszt6Qxz7fi9SqZcH5qn
         7kUGswNyuhTpXi2y0VXsjby/m/aK63tB7V+orH5PcavFDgBTaj7SJI5jPORbP4cIonP3
         tCzGt5POWaTS2QEgdqoqrKixiWaHvqgj2IPR3ewSz8QYW5oUASq2X/5zKO+aIogJQpuy
         EAhFVhuSJqwvX+Lxan3qNPFshB34BOZP5SMt0BEf8PrZoSGXAXGRGVE1naz6nzZpd62f
         8dru5Icneia8WihRqQzZRfgERbL5t3JlfbO/JARmnvdUubUNRHD+kYQ9Uc+FzTkKeSlc
         7LTw==
X-Gm-Message-State: AOJu0YzhGO81N8jGpCLixoUqJs9tXN5FzFpZI44yTu3Ni74v9Drc90lC
	kNN/Bk5gREcznruS7rBFZEk=
X-Google-Smtp-Source: AGHT+IEj+JsLAYsRvKq5tljy3+gyroq6CmwWB5RDT+QP3IP4h/PpnBkxNteaPS5GTU473Jm9OxjtOg==
X-Received: by 2002:a17:906:14:b0:98e:1156:1a35 with SMTP id 20-20020a170906001400b0098e11561a35mr3934964eja.74.1691257793309;
        Sat, 05 Aug 2023 10:49:53 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id f8-20020a170906138800b00992ae4cf3c1sm2938044ejc.186.2023.08.05.10.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:49:52 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maksim Kiselev <bigunclemax@gmail.com>, John Watts <contact@jookia.org>
Cc: aou@eecs.berkeley.edu, conor+dt@kernel.org, davem@davemloft.net,
 devicetree@vger.kernel.org, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, mkl@pengutronix.de, netdev@vger.kernel.org,
 pabeni@redhat.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org, samuel@sholland.org, wens@csie.org, wg@grandegger.com
Subject:
 Re: [PATCH v2 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Date: Sat, 05 Aug 2023 19:49:51 +0200
Message-ID: <2690764.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <ZM5-Ke-59o0R5AtY@titan>
References:
 <20230721221552.1973203-4-contact@jookia.org>
 <20230805164052.669184-1-bigunclemax@gmail.com> <ZM5-Ke-59o0R5AtY@titan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 05. avgust 2023 ob 18:51:53 CEST je John Watts napisal(a):
> On Sat, Aug 05, 2023 at 07:40:52PM +0300, Maksim Kiselev wrote:
> > Hi John, Jernej
> > Should we also keep a pinctrl nodes itself in alphabetical order?
> > I mean placing a CAN nodes before `clk_pg11_pin` node?
> > Looks like the other nodes sorted in this way...
> 
> Good catch. Now that you mention it, the device tree nodes are sorted
> by memory order too! These should be after i2c3.
> 
> It looks like I might need to do a patch to re-order those too.

It would be better if DT patches are dropped from netdev tree and then post 
new versions.

Best regards,
Jernej

> 
> > Cheers,
> > Maksim
> 
> John.




