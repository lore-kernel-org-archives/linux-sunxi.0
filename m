Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861D1139D04
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jul 2024 03:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721706865; cv=none; b=UY0+2XHEx62Ec8+LTAd6myJRkqclxc1TkmaGjZ4QrHhBoMdjVdALh1KAhFv/OhnXMDfxNU8ugEN77WfK5Rxy2S2k/PznneKfvZ+OwbpaxDIdYBow9VXPhqOO//QWC/JOQEyxODL6eD8GrKpbR4AHUd0MgjPLTA0wSHCBvVsWyx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721706865; c=relaxed/simple;
	bh=2mfBfGvPkaBeH2hLbWeN6l9L0QxXvLWhmVsi1nmC0QY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dD0dLIrl7V1OkKpJ957A9Wvn+A51N9OgM0bFr4xj3x7vrdn6ee2b4QeCCipz3cD0utFDmf4Ms/y2UlDWzld0ZcQPgP09eXulPaSuQnL2uV0sx8LIfgX4uUdsbl5PAeKFvoD3KpNgH7k+te/eg2t7WJ7SlIlf8shNOZVR2CW0U0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f04c29588so2190530e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 20:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721706857; x=1722311657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2mfBfGvPkaBeH2hLbWeN6l9L0QxXvLWhmVsi1nmC0QY=;
        b=WCItXwyCwqYO9K9rdy0x0qPkL5R2X9sn/9peg5aKjEm9HwjuDtX85gzN28VyQLOjrB
         w0WxmVNp3PYZFO3XF7mNhM7CCv7N/s7Udz5rJOk6P8/YAiMfMEkAHxfWDbh1FoSYaqfV
         v+wCjHfV5OiWn4qJ0D1E5n+epy/5/ush3/I+7z4lLhUZU5hRl813Pzz4A66BJtgParSR
         9fAAyNor4bGtOYQq6Q717Esv2k6gqenywKHUFDklI/Ah/B9iOSueKoLzpSTDvRWpoxO+
         VGhwYlFHbQjlpM5wvY+DKjBxrGs42p3r3PKe/EF9cyu746q6SwOz+H5RemfbSplsO4/f
         IBAA==
X-Forwarded-Encrypted: i=1; AJvYcCULJXS7sLW/ymUgwFcQ+xfbytfAbLJJeC9q5ifyyJjIV1kCtosIgAealXvUzznMEEp/trQu1F3uOcZtIsBaGoxpCd+rvKqQKRnZb0k=
X-Gm-Message-State: AOJu0YzfrYMxqiIdr5lb0s3VvNZiHkYIkv+7+TzZGCYdkqiLOodYSc9k
	SegwrSucAJ7m2wQJ1apetk6D69sRYi5P8crC4FYI9NuEYANCbZ/R0GWaXHfw
X-Google-Smtp-Source: AGHT+IF6gtwmaFF4qqotEi3yKl/Td0Ef0IyWejlf+4rK0YQCPEquclZyzx3YpS4S4rLLyj587azfIw==
X-Received: by 2002:ac2:4bc2:0:b0:52c:9383:4c16 with SMTP id 2adb3069b0e04-52efb7a0b03mr5530832e87.22.1721706855652;
        Mon, 22 Jul 2024 20:54:15 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef5573612sm1428025e87.238.2024.07.22.20.54.15
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 20:54:15 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so74675401fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 20:54:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX09+76C86AI593NnOZPE8A7oPeG+FfqtRngFNcSTGr87kmqg59iTmR8RRkdhry4zkP2A6ln6Y7TSM9luD+kycU7En7eDA7RT9B1hU=
X-Received: by 2002:a2e:bc0f:0:b0:2ef:296d:1dda with SMTP id
 38308e7fff4ca-2ef296d21bbmr48058911fa.1.1721706855131; Mon, 22 Jul 2024
 20:54:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com> <20240722-xtheadvector-v6-3-c9af0130fa00@rivosinc.com>
In-Reply-To: <20240722-xtheadvector-v6-3-c9af0130fa00@rivosinc.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 23 Jul 2024 11:54:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v65WLShdZLBcKBUviHMWFOM4oZmwVHWzVqCfz2rKdnoWyA@mail.gmail.com>
Message-ID: <CAGb2v65WLShdZLBcKBUviHMWFOM4oZmwVHWzVqCfz2rKdnoWyA@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 5:58=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> The D1/D1s SoCs support xtheadvector so it can be included in the
> devicetree. Also include vlenb for the cpu.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

Please take this with all the other patches.
