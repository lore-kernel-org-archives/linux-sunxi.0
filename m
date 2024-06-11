Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACEF43AB4
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jun 2024 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128324; cv=none; b=biKkusLJrKyPZ13ySJLlgNdQMwxVq8hcN4lstXU8QwosicNGrNWqdxK1BKf1pAnaQ3TzJOIzxvBY2Kqiu0mfGAQikPc5mXBJ8y8/qVp6nztYWRquWkZ8w8FsTaWKde5McY3lmkyqg1aVnslS7VsUXbo2n1cyw/SlvX+BSYO0Ujo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128324; c=relaxed/simple;
	bh=j6Mw7Dc/Rmamgq8D0n3FKdWISB6Vssoz9/RfITAP4S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlr4G5Xi5jatL9GEY5XKlMBjLk0ibbhyfaTUkpByL6i6Gk3FbjhOPEu3/B2x+ZWKkUE58UbxdUQuC6+JsRatptKE+uYYllXb9WYuhW7EoZ/0wsgGlqZK1AM+Y1LYG7AUWSSmMUBo+Ufanhp6ZeOq974qOe9NpWZQfP1FMw6CirM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=HAMxC4w/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="HAMxC4w/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f4c7b022f8so54613925ad.1
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jun 2024 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718128322; x=1718733122; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+kzQ+TESmWH2rodDnJAJg+m005wAbuCyRq3fRyc+L4=;
        b=HAMxC4w/3niKg9rndsrlu3XGse/vp1ca9FbF7u1gJoIz2PedQy2AvwIJ/nXvO7ZmUR
         oUc4Ujfylf8veK0v5u1IaMiBEYPujqKm8fkAFx7Ha5FmMetHfcHiRgtyXFOs8a24AqMq
         vuIA19RA9vp1eNOZbpWaATnmaYYyEQEjgvDuXftD5T33UJQ70A8SRyJAykI7FfzyA8PP
         W0mGUT15++MxFY79f0N8RpR/iIZjAY/5s2/mU+UsTUiEVIVedC5df3KJzwbeeq0IyLXB
         LTRqoLMUFUo8kCAheD9+4MxtPkOMOmSYakJtanKvh3tA40plK7IUmMoxU2H69j0dfpZ1
         MhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718128322; x=1718733122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+kzQ+TESmWH2rodDnJAJg+m005wAbuCyRq3fRyc+L4=;
        b=PXjsLyXM3cneLoGTcFRTgTELSSjARwQdEnKsikVMXvquoTfp2u6jPi52XHmGtBtb5/
         5ze+wJ0wjzS7j2FwlN8XmUmotrxZeplFe3f11J9tKYlM8vbIHF0pbQAyUBqoNiJ8oZm5
         JXDmICFj8W/jtof5iSmX1vNiVCz8Pi5C5ORbylcBjJG9Q6zCxq4Xd06NOlDQkvzYKbdz
         TNaCTTNFoQDpBoYvlZI9rb8Ed1TwFkqQU5pjwTQBrSH3sctAGrHNxIjPU4UX09Vb4DaZ
         vl2nuqLXSp0i1ZxL0gq9TGc541HTnnrzXtkTpuM41dINOQcP1IMw8jonm3SsnyMYup9q
         kS5A==
X-Forwarded-Encrypted: i=1; AJvYcCXscU+ETDnfREhmcFLZTiBmgwZBRYWTDia6dq3Lnt9OwVRqyChM/CqglFpukxpGS+m3VWWQYRa8FWLYms7O/9aGbUgrhoTPh/8iJ7I=
X-Gm-Message-State: AOJu0YxDpp+KksLPJbLIFoNqraRSYCmO2oOwfL1z3pEbvjfuNfM82UPK
	Ov4/u2aw+b2ybJ2SG+IzeT+i0Gtod0pSLnzomrPlzHs8VyO0SnYK2i46chVaXnw=
X-Google-Smtp-Source: AGHT+IG0CXcMZTGrM4/Ht2qa5w3o4qJ6+EtsZ/LkU7bUGzv5nEqEbQ4X3YEnvEJE/XsG2nOTE7o+Wg==
X-Received: by 2002:a17:902:e80a:b0:1f7:2490:cb69 with SMTP id d9443c01a7336-1f72490d4d6mr50156005ad.60.1718128321885;
        Tue, 11 Jun 2024 10:52:01 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6fadca2b0sm59819315ad.206.2024.06.11.10.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 10:52:00 -0700 (PDT)
Date: Tue, 11 Jun 2024 10:51:58 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guo Ren <guoren@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 01/13] dt-bindings: riscv: Add xtheadvector ISA extension
 description
Message-ID: <ZmiOvgabh3Rd5Vad@ghost>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
 <20240609-xtheadvector-v1-1-3fe591d7f109@rivosinc.com>
 <CAJF2gTTVu4ZQt+gK7pVYEDVG23Sic=jswkVvX4To=VAD0TMzxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJF2gTTVu4ZQt+gK7pVYEDVG23Sic=jswkVvX4To=VAD0TMzxw@mail.gmail.com>

On Tue, Jun 11, 2024 at 08:06:34PM +0800, Guo Ren wrote:
> On Mon, Jun 10, 2024 at 12:45 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > The xtheadvector ISA extension is described on the T-Head extension spec
> > Github page [1] at commit 95358cb2cca9.
> >
> > Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 468c646247aa..99d2a9e8c52d 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -477,6 +477,10 @@ properties:
> >              latency, as ratified in commit 56ed795 ("Update
> >              riscv-crypto-spec-vector.adoc") of riscv-crypto.
> >
> > +        # vendor extensions, each extension sorted alphanumerically under the
> > +        # vendor they belong to. Vendors are sorted alphanumerically as well.
> > +
> > +        # Andes
> >          - const: xandespmu
> >            description:
> >              The Andes Technology performance monitor extension for counter overflow
> > @@ -484,5 +488,11 @@ properties:
> >              Registers in the AX45MP datasheet.
> >              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >
> > +        # T-HEAD
> > +        - const: xtheadvector
> > +          description:
> > +            The T-HEAD specific 0.7.1 vector implementation as written in
> > +            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
> URL changed
> https://github.com/XUANTIE-RV/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc

Oh okay I will change.

Do you know the answer to the issue I raised? https://github.com/XUANTIE-RV/thead-extension-spec/issues/52

- Charlie

> 
> Others, LGTM.
> 
> > +
> >  additionalProperties: true
> >  ...
> >
> > --
> > 2.44.0
> >
> 
> 
> -- 
> Best Regards
>  Guo Ren
