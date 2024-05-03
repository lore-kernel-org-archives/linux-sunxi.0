Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B88B225D4
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714753834; cv=none; b=pKvB7VXfppQ7CpD7xrECj+fmStlvdN6VF4EYWx2KqB1zWA2IHD0UnDL6kvM21l5CTxiLKPJsRtR3dS2jSTf4Uj+naYjoTkPnz5Hs2URv+YsptmsQW7m684SJMdbv4QG0iuNgOzWHU4uqdeTxY4w1Wv0BYMEUGliJoq5Ui3AJFa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714753834; c=relaxed/simple;
	bh=WPVcs1TOpK/zIamQ+wtUWsaV9d+WzS0scr8FdFX/12Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eLXq66kQS1xzpEcxo+B2EfjnTZ6YXq/3dianBIPyvtBYZyDH663xHZRymIhyIPDhYt0OnJKpmtkSZJWdYi0hqK2CFVP4x9YGW7VeVkR/fXbu46RTFWFwWFBK+5dltyIYfR1Vmf96L9AZHS1CMWJn/s20DDE3BckhYK9+X6hcA0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Mwfg3OZZ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Mwfg3OZZ"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2dfb4ea2bbfso82462551fa.2
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 09:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714753831; x=1715358631; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPVcs1TOpK/zIamQ+wtUWsaV9d+WzS0scr8FdFX/12Q=;
        b=Mwfg3OZZ2/yFiq8Zd6QGrd9rwXFaorpGxc79u82pMViw2FP0+Rpeb72KvkiKZTcIWR
         ZDwZOHY5ywsaGo2DuNbeEWz8D8tc+Lx4T2oSvmp4Z73oeuzYK3Ppgrg/IHaswOuska6Y
         50q30dufudIwTpCuJcV/ai9G3o3UycvKKwIVrvKA0Dr+9nkc1zkhUwTFgnMq6qDa3HV5
         EfjPAiOyP0uZ7VXOs2Nu94vEXflL3wuYTCAZXVh91oH2wBnDsIGUDEMsxEguD8rksoos
         2oia2uwf8ZjBiXuhz8crZ1vwX8YhJVBMTO7vu5f6e7hGdrvejkk+JObomKaEHVRYJm4J
         NJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714753831; x=1715358631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPVcs1TOpK/zIamQ+wtUWsaV9d+WzS0scr8FdFX/12Q=;
        b=pTzPqSU8e4q4NqAer5ZUtpv/td11Ju6snOB7b2VxywYkgDSZviip9gXlz95imJsARW
         KQSYvSKGGP3fxMqb084UJwCW7LnxvcyG40ZOH8GdXsNiWyUhLBnvrG98bldMLV7kfezU
         Lxmg9GUC26ahrD6YzSqARG735jrf/p4XP9L8W073KTVH7VqymiCQQMrGcjO5C58uxt3f
         QugSghomzQ77StVnBUbU4ehb6YT/KAIvDxdDp4hzT/ktnCzeK39EmOayw2osMcZq2tar
         LyniLeIZAs4ho0tiCwN6XkihqFJizMhe9r/h+2+qJgK4V/0lNFy6E20q4Le2rFGx3qoP
         dm7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBdHHRZKbwdAzy1A+FKF3eHqFW9VW3XrIc55nVfXbeMFACYGrOD0oazjZZvVTS/MhuQEPvMnZu7t3dK4hAIGC9YPtFfyEaKJViK5o=
X-Gm-Message-State: AOJu0YzYDevP/YXLkWm6bRz889HlT2IOnvPFPomuXAi+McrhML6T1U7Y
	0UMzVaU7i9eV9CEpXhaChHVn2sCBW2egepkSPC4fDIDlcylUH+3LzTmWocU0nfg2/KoEfCaYLVe
	EKDqGsxa4ziArdYJghVZoW0Vn35UE/jpl5mAeIA==
X-Google-Smtp-Source: AGHT+IGE7xxu21b/33CNpShSktw1p7c14hONSdRe5GLkslIarmkQXZLYgc3VeAksgpSpBEPHVsKNhmZwLeEcUDNOhGw=
X-Received: by 2002:a2e:9310:0:b0:2e2:72a7:843c with SMTP id
 e16-20020a2e9310000000b002e272a7843cmr1041621ljh.36.1714753831332; Fri, 03
 May 2024 09:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
 <20240502-dev-charlie-support_thead_vector_6_9-v5-15-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-15-d1b5c013a966@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 3 May 2024 09:29:55 -0700
Message-ID: <CALs-HssJRSZjuDQjeDiSRYCyEnUDBKQRNCsEVPmLrCKfz_H4Ug@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
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

On Thu, May 2, 2024 at 9:47=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> Document support for thead vendor extensions using the key
> RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
> the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
