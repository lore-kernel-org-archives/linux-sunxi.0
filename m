Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3881914C582
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 17:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712942008; cv=none; b=JCrZunu+gIUw/bCBwW8M1cumUx/LrWtsemgoKaRXQz4albkm4AIhFFv2yjvg12uyHEOclSfmVNBkpN3jnUooVELgBRFAdj+4zykAW6inXpoilltC1qKQSpnWEwQAqcgxRjkeM3UWydgdfJxJB2Dm8QjKokb5qM0RhIym+91NB/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712942008; c=relaxed/simple;
	bh=BOw65jefwZAEXrOKSe45kDD1W0vdEDtUimtMT6vNJrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2vKVjxjjWtdP1sn7NustqPZO6AYMItj+mEfwGS08aGxTkjfLsbdZbM2ImE4FVWpHX9sndkj+KVYa9MySz2Ok7nH7jlmkdP/W7Topidewian9/EWbeuhfp2zgS69LWAXfUf5ac6/RCo2oAKUU8vWSe4Yny67YaWFL+4W2xaJ6jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zPycGYoQ; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zPycGYoQ"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so695293a12.0
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 10:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712942005; x=1713546805; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Soc0+QXn5W8zbaSk+coOpUVEhCceV3S1TAiuN1SZpPU=;
        b=zPycGYoQXtToRjYFY3BrQ0W3rZsQ3tl53czvtpvhphNwKkfAF4hbVxXdxbL99thBTD
         0GbX/DQKLqIaLMVPR7rOcBmhmsqY3NzgHEHRZDYpECXdBBVJVf/puHopctrXEtDtOoIK
         MlLITjyJCzAb2cXQVInJ/XfaCMQTDr31Aq656Msap//J5+AkVsO+h6I+Ec8HkEX87sdR
         zZkXBPAx6jm3l0wI8j8z683yQ4WOhACdjxcb8oijpKD/QpW7RLUgLcK5JnyCCPG3uV30
         HwsJ2ckt4y5YYIp7KpQrXd6ek72w4CJg2sF7ycsXxYTAkxdc2oWB7eNcN2V687Dg/ScW
         nUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712942005; x=1713546805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Soc0+QXn5W8zbaSk+coOpUVEhCceV3S1TAiuN1SZpPU=;
        b=K5LrHIpzlqbH7pCzwkgJOp6oaDEGKXSSJoVK3tAUg7VYzMnvNyiSfDzNFlKyZq/UK1
         de4OE70am4wMO+lwJ2NydltZHQFxYDRvy+uy4cBnZ+81Rml9+lZ74dAThIHRJUIYOCNd
         gpEA7yVzMxZWgk8NB/KPERGcUyl2ESRvFz0dkyG7hg33KFXcIupAz9zGrEM/misZUUSb
         WXlwVX1AXj5UGtmm7uO3d3J2ohURZvfhlzsZ6sB9eu+73YgiMR74YpWEFYMp7xG7va5f
         uN/5mizXLMM4F+lBl+srpcoOWn0Wbynse9VPmXJKfZs2+gybjIVcC7lMBzXePbAm0RBF
         XnSA==
X-Forwarded-Encrypted: i=1; AJvYcCVkqbuKVL0ngEvkQVeoltZqq2WGwY1To1GlPhqgzfmBy17Bhj9O1YyS0eifLuzKtj7P8Rm3R/c4WyMGtR1ZS9Jv3hxOd81d1IVVBEA=
X-Gm-Message-State: AOJu0YwdOizYUaJb01NqIrVEHev+LiXNlgdld5yDFAi66xHZzIi8a+Nt
	BNXKww8rHXwgygQ0R0f3QlPcI3qqNG72WbEzQCzHub+016wN7sfYuZQQfUw9IwE=
X-Google-Smtp-Source: AGHT+IF776zoVnfiTTi5WIsaQ3v4fo6KtFc0W2tiXFHOJ67WtrOcZCtTV47KUhKhuAyowf9bIsmn8g==
X-Received: by 2002:a17:90b:1001:b0:2a2:775:9830 with SMTP id gm1-20020a17090b100100b002a207759830mr3316998pjb.11.1712942005487;
        Fri, 12 Apr 2024 10:13:25 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:121b:da6b:94f1:304])
        by smtp.gmail.com with ESMTPSA id ge21-20020a17090b0e1500b002a6e67e197dsm1458645pjb.45.2024.04.12.10.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 10:13:24 -0700 (PDT)
Date: Fri, 12 Apr 2024 10:13:22 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/19] dt-bindings: riscv: Add xtheadvector ISA extension
 description
Message-ID: <Zhlrsl7CKcl6cdSC@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-3-4af9815ec746@rivosinc.com>
 <20240412-ream-dwarf-8cdc3d0f279c@wendy>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-ream-dwarf-8cdc3d0f279c@wendy>

On Fri, Apr 12, 2024 at 11:27:23AM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:09PM -0700, Charlie Jenkins wrote:
> > The xtheadvector ISA extension is described on the T-Head extension spec
> > Github page [1].
> > 
> > [1] https://github.com/T-head-Semi/thead-extension-spec/blob/master/xtheadvector.adoc
> 
> Link: <foo> [1]
> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/extensions.yaml | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 468c646247aa..3fd9dcf70662 100644
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
> > @@ -484,5 +488,10 @@ properties:
> >              Registers in the AX45MP datasheet.
> >              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >  
> > +        # T-HEAD
> > +        - const: xtheadvector
> > +          description:
> > +            The T-HEAD specific 0.7.1 vector implementation.
> 
> This needs the link and a SHA or some other reference to the version
> of the document.

Okay will add, thank you.

- Charlie

> 
> Thanks,
> Conor.
> 
> > +
> >  additionalProperties: true
> >  ...
> > 
> > -- 
> > 2.44.0
> > 


