Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE216B731
	for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 16:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716913034; cv=none; b=ToB/UShxoGnhhQ95cuUN6hPWw0s5V+JQYgqJ3vo519z709lyAObijYoKDdYA6irQ3ma5Of6AC3FlccN8fNt8l5KoGUUqJ4F5LKF8KylL2ZydbFYESHxlbzfuyIQkfhQagnyJGROlW3yh95oLjgm5HuwIZIfeak1FA8lSBkKMpKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716913034; c=relaxed/simple;
	bh=ZJJp9PavHBfDU3cnxTSm/Kzg1wrKhwuBqR/5e+li/jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfdtZRu1WA7cmnbcaLqGFVl53/NGNvvl3r3pEKiFEww6DOcDMti+USTkC4bECXj7pPb20Dt/97nmE6ePTgPhQ6dw25BDWbON0YCK5NvNNGv/nf2mSnNSyhiFH2k+6Hjh3LwSgHuM0idsR/5Il7DFoUuCaPjz7FZdPIfh0ATP4Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52965199234so1186874e87.2
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 09:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716913030; x=1717517830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POQOGQ5K3bE6qgJcC1wmgZLXFfBrxNj838TwyNFS0Ic=;
        b=gL22iC6xLvYTIJWzg3ISpVpg1npHaAN7UktbnI7QStVxyegJYDV6mDJtNDzGPB9hyQ
         cjgY9b7nB4uDqb6FyJakPswpXTvZY4qynQY+fV0WNW5uvypohqN85cyHmwUcU9Ts4ScP
         iEOErU9b7Ltux3WqJ04F/aHy6PWtUBRj3raYcmdLfghFq+G9xSAPbXuZ0HhPqO1DGWRw
         UYR99DwTzLCehhWnKMxH1ZwYtyD+jqRQXWmUwg0Qbr/ppz2GH/WxSYnnZvHtBwqwiY8B
         2ObSySfCg42FjlPBw/VUrRgYRlGmnmn4z3M+hWMSwCTGqCF2LluZBqXQm4Y9SyfEits/
         fq7A==
X-Gm-Message-State: AOJu0YwAjn6AoE89ZG0xwZ8fbL/jj7MufZzBlXTW8qq3YayVSkA70TZf
	3wKFlDtnT/+jleL7YYu8VA3TutJmAYZJqgvoG+t+zXjxkpELirbXRsVBRvVw
X-Google-Smtp-Source: AGHT+IGdlryjXU7Xl80CcQF/D4p4CsUasTJ5uneizgO1Ck6GVZbQpQklCrFNVb9fgbzKJb0fpaQ6eg==
X-Received: by 2002:a05:6512:3241:b0:51c:df1f:2edc with SMTP id 2adb3069b0e04-529644ebe8cmr7164720e87.2.1716913029883;
        Tue, 28 May 2024 09:17:09 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b08asm990452e87.126.2024.05.28.09.17.09
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 09:17:09 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e95a883101so12572961fa.3
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 09:17:09 -0700 (PDT)
X-Received: by 2002:a05:651c:210:b0:2e9:852b:80d9 with SMTP id
 38308e7fff4ca-2e9852b8193mr23187971fa.8.1716913029436; Tue, 28 May 2024
 09:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6a772756c2c677dbdaaab4a2c71a358d8e4b27e9.1714304058.git.dsimic@manjaro.org>
 <171691265249.683236.17741143131124450716.b4-ty@csie.org>
In-Reply-To: <171691265249.683236.17741143131124450716.b4-ty@csie.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 29 May 2024 00:16:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v66D=cn3jeK2OkfeJ52jyNSMe+244cO7AaTy64ritVVtJw@mail.gmail.com>
Message-ID: <CAGb2v66D=cn3jeK2OkfeJ52jyNSMe+244cO7AaTy64ritVVtJw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Add cache information to the SoC
 dtsi for A64
To: linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>
Cc: jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 12:11=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote=
:
>
> On Sun, 28 Apr 2024 13:40:35 +0200, Dragan Simic wrote:
> > Add missing cache information to the Allwinner A64 SoC dtsi, to allow
> > the userspace, which includes lscpu(1) that uses the virtual files prov=
ided
> > by the kernel under the /sys/devices/system/cpu directory, to display t=
he
> > proper A64 cache information.
> >
> > While there, use a more self-descriptive label for the L2 cache node, w=
hich
> > also makes it more consistent with other SoC dtsi files.
> >
> > [...]
>
> Applied to sunxi/dt-for-6.11 in sunxi/linux.git, thanks!
>
> [1/1] arm64: dts: allwinner: Add cache information to the SoC dtsi for A6=
4
>       https://git.kernel.org/sunxi/linux/c/950c51e8ebb4

I had to do a quick rebase as the branch start point was incorrect. The
commit hashes will have changed. Rest assured that the patch is indeed
merged.


ChenYu
