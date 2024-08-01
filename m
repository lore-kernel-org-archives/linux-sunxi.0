Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182FE1802B
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Aug 2024 03:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722483685; cv=none; b=l6IwH+f7qSIpcQ/9Pw0jnctAtpN67TpGZFqCYF2cFdEcRnj2We1NTFc6vniEDGlgLEUmdV9/Y9C6KRaoB5QMXLhEI67cSuDkZPLKtByKhdEcIKjxh09gaVEAO+D8ceYnMASzmHS84Bh47GVRVlNCLD0eUNRwsgURIQLoU/go5kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722483685; c=relaxed/simple;
	bh=m4xYWVIGQDvqhmSV4J6ZUQ0pXgYRiqcojx1bzWRAQZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usSY4RZ691oA1QF5t5LE29Mxnb6aekv89I2N/H5rEGBOr0tXYu/HmDWIiqvBAUVROXNmfTpIx36n4ZQBypo18VperojcqOtVtAqHA2CSIntDA93s41P3WRa470xAzeEFk8gyPwHa/6xB91EtqYLrM1plkxkZbX1h8QMNOtwt+Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f024f468bso9433990e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Jul 2024 20:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722483679; x=1723088479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpFbA20aLHJ+Am8YxkTg4RUa3XKubG9hiY6Kx7P8xtw=;
        b=ZgWOLLEutzjASFa5ym9TF0X7r7bSyA7//n7OXd/TXsuaweAlY8ClXvax57UxiPdv/W
         OMtEcvJYIlDY50WlBzXJqbHYtV+DyMusSb7VucCVXhxmpB2mx/zVFcPUGt5AR6euwCoJ
         wVWgNOGK4i0CulPrwSaZQOyotL97qckKvrJlcTSTE5jDGA+X63xPsSijAD3JPRl7YL6I
         1o50g6YeI9gRrbTAdxgoVETWCi8yr/FyDU+083WpjYhXKxWqVIMFb4YpUQWwbli18Lol
         cfPj3jEQirz2Zr+j0Pd1hvAvMyrvIiWJGgIbyqGAhVcS+jjDbHeGAzoO8j7hfGPLImCO
         Ai6g==
X-Forwarded-Encrypted: i=1; AJvYcCWWrG1DcRBR8yxNRJza6nPJVSCScdwnX81hCFzy58WINRJdox0Va3v6WfQOk2S2EwKbifYaUGPAoCdwUqjxOwU4Zlss9GhEh2TmS7c=
X-Gm-Message-State: AOJu0YxB1B+c+vJDsPGAxxsAZAKA2Z/axWnrA96HF2lQzy7XxXPuYa6V
	8QRqzQFykjU9Tv3x97UTgg1Zw35WxmH/IUJhBxxraM+WIaOlrlGFDhZ9Hmxr
X-Google-Smtp-Source: AGHT+IFYtU/fycEg3TVAvj6KnUlCwzC9moMJeG1nz8Q0P7txSGhd0oZYEYiSv5VrV4OSYWMDPhOiHA==
X-Received: by 2002:a05:6512:3f08:b0:52e:9c0a:3514 with SMTP id 2adb3069b0e04-530b61ebfb2mr516918e87.44.1722483678889;
        Wed, 31 Jul 2024 20:41:18 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c2cfb1sm2439410e87.269.2024.07.31.20.41.17
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 20:41:17 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso74434681fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Jul 2024 20:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUE/Q4lXLDrI+7IYDQpXPO8MLivDz0bjM/Oxu3uKl4X8Z/Vkt3xXTf7FEp6A2GsDhNy1YpWaHCPgPIvHPWd9iEujdaync2CJomKDp4=
X-Received: by 2002:a2e:84d6:0:b0:2ee:7a71:6e3b with SMTP id
 38308e7fff4ca-2f15310167cmr6804891fa.27.1722483677641; Wed, 31 Jul 2024
 20:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240731191312.1710417-2-robh@kernel.org>
In-Reply-To: <20240731191312.1710417-2-robh@kernel.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 1 Aug 2024 11:41:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v65GvkyMS3kZWEADGWKvZ818w5uvJASkEMrox535c4Ba_Q@mail.gmail.com>
Message-ID: <CAGb2v65GvkyMS3kZWEADGWKvZ818w5uvJASkEMrox535c4Ba_Q@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Use of_property_present()
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 3:13=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> Use of_property_present() to test for property presence rather than
> of_(find|get)_property(). This is part of a larger effort to remove
> callers of of_find_property() and similar functions. of_find_property()
> leaks the DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/cpufreq/cpufreq-dt.c           | 11 +++--------
>  drivers/cpufreq/pmac64-cpufreq.c       |  2 +-
>  drivers/cpufreq/sti-cpufreq.c          |  2 +-

>  drivers/cpufreq/sun50i-cpufreq-nvmem.c |  2 +-

Acked-by: Chen-Yu Tsai <wens@csie.org>
