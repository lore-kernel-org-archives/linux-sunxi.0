Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762098;
	b=TL8XJTnz74eL5Aeog5/NIf4W2UqawDg7ccosIZmVyKQYNKCAL5VkMqoI7YciHtdgW4xG
	 HLJTTU7ocm1IXA/UMUS1s5NBYhVdVdzg6HInWmHl/HIW1VWBmKKsk+CDGBHsuNu0/s8f+
	 sWON+tRFgLY6HP0EUp29+B9zn9oI9A9ivYUNm4e2e+4hcWaCy+D31zGLGC1zTQmPbPc+X
	 CnnyjdyVPZ0DINd0i8dGjItXeaQastuMTjlXqE/IHRMpI/ID2bBRstFUwyrHRsL3EpK40
	 cVDUl6z4T+e/zfiiEw+TKUZMTsmAmNFQAwxfMRrJZmZg+zACLOMcbcn5GlLKwX4668Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Y9ebx/NeQHDJ2vvkvIEG+xSfxmCUF1LYcJcgNXG5cuE=;
	b=vSzcB//UhrRDnKYfm/ofNBnQ2OAMZIqEHqrU44kSEajJNLGrSW5pqmlxNgZcKu+Xu20j
	 X2/p/KvkUfDFWVAzN1/5ladsNIQ+g/el5VpBfHREc6bJuiQ3iyFLsMvRylxBii+lnZ/tL
	 KTdf9sHMv7WXnhdEJKP1dvlZSa/qeSEkmF9uyjTm6e2PTmxD4S4MYlZkclnA0B0b4WWlD
	 GhK4vIxADVj/oJSJfD25mW2/baXIkqNpzae83w4raoks9UL4hLb5BtbKMsAkRRi4f59HD
	 +LyiM7IqUOxLlXQhnibT6P6e7A9LA3RwJeUjKnbYzv80YxnLC1ZWSjKWA1Jc6ArwqWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dji6KFUj;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB5606A88E
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 17:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CCB5606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dji6KFUj
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1203246f8f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762096; x=1795366896; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9ebx/NeQHDJ2vvkvIEG+xSfxmCUF1LYcJcgNXG5cuE=;
        b=Dji6KFUjuviGBludDqLm9dS4kqeXceuyTu0IQqVVd0lM2VlFOQWtjsyM0N01+sGcq3
         3DOSN4/4ZzzvLaepg0amy53/ZLKQOKhvszg+3rBf9fmVsLiHvvnGU/0CzeOt9a1ROmHl
         cS59O017va4raUA6QdK2lMjd7E2M4/Y/QBCNWtvZNzmKZ2eSDLa6yPOquLhmqmuCvxtx
         6OKqj/Ftyk0EHIY0MCiETMWCMbnrd1zZUiZON5PihICgj1OepnOJRggGoISWw8HdgYc/
         Lg84wPB6sYfE6PIvmxbE7rtwGLBLL/jm6UYIanIQqhwCynuEFKv930Tu0TRvJ0KdcJ9K
         3yNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762096; x=1795366896;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9ebx/NeQHDJ2vvkvIEG+xSfxmCUF1LYcJcgNXG5cuE=;
        b=1MH9WWNzmeAn8ByPl2127QkMfYkxCyXZNsXYg8+U+QwHvaMo386i/grmErzdsbEG3f
         h6gLQcWLok583UhjpemvK3ewuGQNnr0wypnczJD9oVuNx+GTKcva4e61vC+OSpRuCh9V
         Nq7ePGt4UhLh/G+Tq+OjDlwCZxLzAJ/jo/cKAJheWnI1EHhlTR4ywww70WzADxR49xyZ
         lapvqQWJ8O+bwBluOLo9xkM9EHt1ahqUDVJqv99UmOXazXp/uA/EAohZqFijByzpXu+/
         rBU8N9sp2c4rm/W7zRUiB6xg/bG7l57RELHzm0C4hRVnlmZst0cI47D90Ep1/ECFgM4C
         RygA==
X-Forwarded-Encrypted: i=1; AL+hErE8XMgBxAcaDxYsTawRFLvfrJZZAPSEnsyW1WLpMFo5SwwaGKkiroveCpKmVA5SofLCHZXVCbnWJxdDMg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/taqHTh5LIjkgafU6Qn334j9b8hzw1AKSLOnFLCeXiTITN4Wdi
	gV2vlT6I0dqCCOIYA2CtP8LQe4XwGNmdVotkJrVAVvKlYsThhLNxEJce
X-Gm-Gg: AYBFou33Pcz6kkHxj0rGRR3GS8yBcfiz45XGxE949KfKND/aXN3129xGD09rEvJCZTq
	VRjwqu6q322nnNKBoFz/d2xhbtMpY984Zg624l5gsP25iZUrhpOV2MyYVldIO7IAtOhLHFMJtj4
	patGTAJvTgM2+hicTaiJ7wEbJPY1PhIfKZm5rwwnXSBQ4Dau0IOlfPl/0MdqN91Fw1Ac+vx+oWQ
	8zlIsapBJeseThDYF2F3agSmx5clGa5VpHD1gvhvXoJWcwQ7bUcfqAvy1/GuTcQ5kzYbcn1ufYn
	psKQ54NGvZC9R8zUJ2MY8TZCPdQXVjmLeRwII4saEuje1XskrfqAE00O6z6IPw8emu2HebNwqYk
	9n+/6uSBPnVSJK5eXvLsKDikVh/vCIMZX7MWGh9kB6u3/4hj0t/Mldf04qH9Cpp2yQ+SjGD0mfe
	i+LeYcc3fsDVig/bk5KlLQ0UYnvrAwOs+fRga2tY6K2Zxi+rwX/wJ5d/sVfu+rQWiD32M4Q8yBI
	s1YOz267tPF5ZfFWK6uVOiAyIE5SV5Zpj/4TVami10G8fW+EQCNzcYAWpOKw78bpT1dQxrwn1cF
	nIqEJ9HV63kgEjcceXGK6DoZr5Tk8TQUmrE0ikpXPw4qleXXvjg0YkGcuVpfAciFS33J7p1hgrJ
	eEgj1ni2PMIMHnbjlluxSlBvQpSSkmjbFQ5E6uKVkhZhbdTyxWdGjr2v/3pQTvDKuqN9QwKJk7a
	S4CDlGJp4a6+RL21pPQqW5N/GcU2cY2QTTS7mQmQURBL604gnYIswyOr6g00L1nrT4QfAT0P+yD
	Ylna2HVy7gdGqhmnRv25XD+lw==
X-Received: by 2002:a05:6000:4a1e:b0:48e:61c9:4e32 with SMTP id ffacd0b85a97d-49c72ab0820mr17765285f8f.32.1794762095871;
        Sun, 15 Nov 2026 09:01:35 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm12650661f8f.50.2026.11.15.09.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:01:34 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency
 scaling
Date: Sun, 15 Nov 2026 18:01:33 +0100
Message-ID: <hUUAMPreQkqgr8nLJGKykw@gmail.com>
In-Reply-To:
 <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
References:
 <20261115132215.289236-1-jernej.skrabec@gmail.com>
 <20261115132215.289236-4-jernej.skrabec@gmail.com>
 <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 15. november 2026 ob 16:09:23 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> On Sun, Nov 15, 2026 at 9:22=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
> > so the CPU never scales its frequency. Add both, like on Orange Pi 3.
> > OPPs above the regulator constraints stay unused.
>=20
> My review agent noted that some of the other boards raised the constraints
> when CPU DVFS was enabled. Do you think it's reasonable to do the same
> for the OrangePi? Or do you want to be more conservative?

Yes, I'll prepare patches for raising constraints.

Best regards,
Jernej

>=20
> Note that I already applied this series.
>=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/ar=
ch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > index 40c5c42b347e..a2a2e4cb0256 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > @@ -5,6 +5,7 @@
> >  /dts-v1/;
> >
> >  #include "sun50i-h6.dtsi"
> > +#include "sun50i-h6-cpu-opp.dtsi"
> >  #include "sun50i-h6-gpu-opp.dtsi"
> >
> >  #include <dt-bindings/gpio/gpio.h>
> > @@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
> >         };
> >  };
> >
> > +&cpu0 {
> > +       cpu-supply =3D <&reg_dcdca>;
> > +};
> > +
> >  &de {
> >         status =3D "okay";
> >  };
> > --
> > 2.43.0
> >
>=20




