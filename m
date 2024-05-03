Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CF333CF1
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 21:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714770248; cv=none; b=ktozEXDWsWcQXcaj6qr1frCCj1A3nqtGTQ+tV81vtJZQrbKumn3gKHdmLcOl6dFV24x9d+4rA+qq6sqvBY5nruedfnq+YphbP/HpYTdAR1B4yjQ1+FkvbgBVq42zWZ+un5BECRLzPNTrpCrMxKHz7XPmO2oeClY5FYNVmwVt/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714770248; c=relaxed/simple;
	bh=kr8q0vJdMraPMNcp9YTW0aQV6wa6XsOli4AJVOGN+FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=paPbfVHmfpsQ5vkkWvkC4ydBDWErZycScX5QnwbdUEFFIg/OQux8fydWE9AHhqraq1vow/MDVOKzfxoERC9H2W7XvtD9HkAg/gT1BhBBzhbHpQ7HAiH2x5sTbhQMvOC2Al5d7vIWSbyRJbPQvwBzjVidLJHSgMK9LqwYqcNPSvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=TO7Q3ycu; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="TO7Q3ycu"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2dd6a7ae2dcso1939721fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 14:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714770245; x=1715375045; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr8q0vJdMraPMNcp9YTW0aQV6wa6XsOli4AJVOGN+FU=;
        b=TO7Q3ycuxqi1tdgLQuWRGL6v1iudmTMq3SmyknA9YGVJ7B4DVqWK6C7kjX/TQBBu4k
         BdxQSjNsWABngKAdMCTcps4VlfuBXV8UhDTusx3QwMtEYB0Y85xYlL2kSna76rKQLQb/
         pKuPmBd6kKXQzaBFlk5Y0ioOr2MA1oPZKafUd7uJAxLtQGkjFX4VFXI0CjHYQANaol7n
         brzFDV0XIgb/WvHVweiZ/Cv93Tf7BAy7BylAm3OJBd8b6teciShrAb8VmCnZR64Igcom
         41G69to+0cHtYu1UHiyVM/vZTYRq8jbKPLfErNHVsKUaUdme+ZWHJiVtDT30eSdzFxEO
         H6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714770245; x=1715375045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kr8q0vJdMraPMNcp9YTW0aQV6wa6XsOli4AJVOGN+FU=;
        b=SWlgi7+rCCiY1tHD4u5iJ1kVCeBJ9EI7zA00TlG4dzURZEPecrUDe8cFuH0dU0AaGN
         b4j7LwS3QVSOUKbtRCqEIaTosyVT3kjm7SoASLB2t+6ZNCae+hERcZBbSj8dtKClT7j2
         PD3lBDw4lzEbibQZTxz1QebTVYbC1i29jljPb7UoOUH9hqsWeGiZbaY4XR9mB9AnV3nM
         tC9LPfDA0wvnGZXollgnxwnbiRgCX+rAW+JHl/oa/7Ag8DBliRuUe98Nz4zySTUI9q2Y
         Sskp7oFWbAyB+3poaetVrM96mLTXC6DMrHJjQ/1f17MYqNLPxKI2a+H43M9fO6leJbKj
         xFgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu9rh8MWXGM3GpEUQM5kw5XQG/QnY1x0NyH+M26Zx9jgtd3WJT7EuiU49JIapfhy5xo4GSZKf5Copr0vCOGEWRDEGBWoZCzsMVJEY=
X-Gm-Message-State: AOJu0YxWy/GFcL4JICRuZzS/XLWY6osUAPb5Aaw3/tBfyuMxuy4W/9nI
	VDvqJYrPvhi6hfJX21jDEXe13zBfv7jRqmuzPQeUQiZguU+RChIHO7QJucjyLIK10fmIVRPn3MA
	AuC+KYDqQKDcySUA9mNzN/7rPMu2KYPyAJC00/g==
X-Google-Smtp-Source: AGHT+IFVGeh8LKuvAXn0wbATQFthajoGa9wA2FpRSy48ryw0IkU/MmVyuccePKcDYu88/CEm2wRejt72X+QG3nu2ZVk=
X-Received: by 2002:a2e:a71f:0:b0:2e1:f255:6673 with SMTP id
 s31-20020a2ea71f000000b002e1f2556673mr3009473lje.13.1714770245520; Fri, 03
 May 2024 14:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 3 May 2024 14:03:29 -0700
Message-ID: <CALs-HsuH5KM4OEH3Uo58cq=3Zgr-gd43hhtOuP2tQFDyDUjq2w@mail.gmail.com>
Subject: Re: [PATCH v6 06/17] riscv: Add vendor extensions to /proc/cpuinfo
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 11:18=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> All of the supported vendor extensions that have been listed in
> riscv_isa_vendor_ext_list can be exported through /proc/cpuinfo.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
