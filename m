Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5978145FFE
	for <linux-sunxi@lists.linux.dev>; Thu, 16 May 2024 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715863711; cv=none; b=Tbti0f74yhT3+nt0PqtgDSk9w+7OIescVLr3mML86MyLljXIsHTn20H8URv2EsIzcEAtCUj6+gJBswzFggb4eouuqhtyoUauDvduM8br1Wk9zhi4ds/82TT1GUyELJOk9xCypDuaeQwVFV5EECtBRNCCNfRo1ydgOckTFt5xGiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715863711; c=relaxed/simple;
	bh=llODjkQVmJ0JRKqb9IK76GX35Rinj4g9QpPEqkPd/NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKUEh7d0Jj3cHlKbKkLUdHyBPN+0cAOGnBJLKvAEdGmv82v0HcFuje3a7c9z/xazJhcI0IwPwrf0DSq3OviOAH5B5k8056bOPxSNr89pdXnJqGJnmsb6VMjIsiTOuwtXCl3GOV67h/JKjDzFGf+MR5zlTl2yL0IrSU5FUHpdH5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=NVqE3wUY; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NVqE3wUY"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-61bed738438so81805167b3.2
        for <linux-sunxi@lists.linux.dev>; Thu, 16 May 2024 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715863708; x=1716468508; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0YMZmj/yuBSBh3+Prm3doCFTI5UB0khyraQ6llJYcQ=;
        b=NVqE3wUYG02mGCXDU2no/Wf9ph32AqBBcxq6ziCVZubdBgNhmxr4a+CGmAqsl1OlPy
         JJfNgjFvYETz1xCnh9OJpcJRJVSBaLqBkUFCy4hPrYR8RaJfXEF3znf499reOjhDxCj/
         Zx0VEPzfFuhObWqNPVB/pxQqdzm1VSWhbD26xBCVnyDaXKThl510yTky/pXs1tHwjBEH
         MrZr9aa956zWVcNBLR4ya/DVdAwroX83FHpZVQ+q11zxF0ZTrFpvQ2xQt9Q8KkF478xW
         Gi2DfTfH4lsRl7uTUaemXy3ksaxYSgtfDpFiFkLxVDwPtBeOw7U6gUXT9qTHDxoVDTj8
         KoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715863708; x=1716468508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0YMZmj/yuBSBh3+Prm3doCFTI5UB0khyraQ6llJYcQ=;
        b=bZzSwqyekeKCnHm69ueCQ+Cq+9kALaBrlZUKEL+srFr43Hl9RDitOUs2nG0q+/Ieab
         kCWEHc35Xl6xqw+SrcbieSpUjnjtln5yOqXJ358wc9z+DW3tcXog6SK1pYHWIjeDdm1P
         wK444wBYeCBXZYtyONWMjrBPRqI+I6c+GZPpYlP7U7AUpGECfv1bNNxKPfCUZ1RlfDLw
         HIjEZ2FyZuhtlmVOrPyyuuW8BCeOC/vVSeVc8unIx7Bb8B/+o6+pwqV0wpmt7Wfgq/+q
         +LyCTYgKdjHAKSpw2F2KWmsUTCqA6Sd6urXFNc09n5OVb0Cd/k19I8rmpM3xPnap8Bpe
         CvXw==
X-Forwarded-Encrypted: i=1; AJvYcCVVYaalL4NPBCWZ3GvAI5EgVm5xhIl2jJxar+PMTpsrTLfy4Ivzd+98l873/9zt80lQwIdCtx2z+u+4fVr7YHxyCzp76U/ggAx8cQI=
X-Gm-Message-State: AOJu0YwBJ1VSmAqDGpgDRdLH02PwVJNJhno7Ry9Bm0IWIVMzQTSfuJ09
	K4/GHppRbInl3n5ljw4X9h5AHyUIDy3fTJdXb5kpuAc7HBmRHk0ybIYw8FSv2bqaeRA8A09sUz6
	c1C5lSt7pHQZAHbAhkHcKV9EEUHnkXPKuHwc66g==
X-Google-Smtp-Source: AGHT+IFmiatJ0VGsQTQP54hpUSwoqwi/xnPZ1Pzr4sv0QEqyqVyV9N5SU92rESBXEGjCyeby+CMydFjJBhLe6iYVziE=
X-Received: by 2002:a81:c70d:0:b0:61b:1bf5:67a9 with SMTP id
 00721157ae682-622affc9c33mr175662497b3.22.1715863708404; Thu, 16 May 2024
 05:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-1-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-1-cb7624e65d82@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 16 May 2024 20:48:17 +0800
Message-ID: <CABgGipU6rybwUo3ZW_RhH5VgWcFqV0x6RTrKAaMXS6=tfe2t5Q@mail.gmail.com>
Subject: Re: [PATCH v6 01/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 3:33=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> The xtheadvector ISA extension is described on the T-Head extension spec
> Github page [1] at commit 95358cb2cca9.
>
> Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cc=
a9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Andy Chiu <andy.chiu@sifive.com>

> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 468c646247aa..99d2a9e8c52d 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -477,6 +477,10 @@ properties:
>              latency, as ratified in commit 56ed795 ("Update
>              riscv-crypto-spec-vector.adoc") of riscv-crypto.
>
> +        # vendor extensions, each extension sorted alphanumerically unde=
r the
> +        # vendor they belong to. Vendors are sorted alphanumerically as =
well.
> +
> +        # Andes
>          - const: xandespmu
>            description:
>              The Andes Technology performance monitor extension for count=
er overflow
> @@ -484,5 +488,11 @@ properties:
>              Registers in the AX45MP datasheet.
>              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-=
5.0.0-Datasheet.pdf
>
> +        # T-HEAD
> +        - const: xtheadvector
> +          description:
> +            The T-HEAD specific 0.7.1 vector implementation as written i=
n
> +            https://github.com/T-head-Semi/thead-extension-spec/blob/953=
58cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
> +
>  additionalProperties: true
>  ...
>
> --
> 2.44.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
