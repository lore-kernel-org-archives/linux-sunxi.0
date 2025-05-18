Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5821136D
	for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 16:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747586504; cv=none; b=OT+Nc56eNPCzZ/4vQJh39bRaloqK0Xo4qFHcZcPdU8zf7IXK75GgVzTvDQ34jLRwL/7cySM1rPgxXw/1PDuwOyqYvzxqYS5wC+qZR+k7CJwf1BbJ5RVMwbzQ+UuzHWDYrsbpLNhM0JxdUxG8vWTpZmPz5RlJ1+w+C0JanMdSqxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747586504; c=relaxed/simple;
	bh=aZDebBuIwhQGKIA5zH7FXUsKlBBCwxUk5Cqi9xBTjTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YpfS5OzM11QNZSZlM+IMB9KMkYVaID8tp4Qb+dH/6iW9JNr34A1fbxTTIrDiL4I+YkgJHcpaYYxs1f8WaLbUUUBdPVD2oofiBZEH2JvfIuFNugDq0aUmsW/HHl0QuYGCyoEOpnTbbEMSFzl1WVCFFnuGvUcR5Zy+Iv9q6fLLE2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d8020ba858so38980535ab.0
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586500; x=1748191300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZDebBuIwhQGKIA5zH7FXUsKlBBCwxUk5Cqi9xBTjTY=;
        b=Yb8X6dMJdIX/Th7TE3NdqApFqBUb0cZks+in3fc2MeADXYFQJ22+Ktfi7CMNRWbDjg
         imGjS19AR7/cpq8ro/1l1yVnSJq7DHoCngPmlf3WOp5SIGmYMXkwNBOXn1ERn5UKNqm3
         IX0ordjc4Ocddyw1GUwhj8v7ieYDjgVKYdc0b1uNA86kt7e9IKS636gmsYBRuNFzH2e5
         IbLTVV5QooZc68r9Ut0sAWLsR4XklZzjfZNk0XrLH2IUOpQpDuuOE6NMfQOHF15c//Du
         PIIrdETzmGP8Hkeos1AVTS3OjLqcnjiZBcb018VQTcR0QtwWuuuZgb7/xfocaWcwb8Lz
         amhA==
X-Forwarded-Encrypted: i=1; AJvYcCVfUt+EVSezbFIN1lAX6TbzKPBEBnieKL2BtqTG7WEEuzngBoR2krGIB1JJNGKjQLP5vvuTyb+TSHLCWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuNNA3Un52CI3QmLPvakKisf2ITSDbkJBnSIrLnwR+6j65MjsW
	FdXwVc8i5x4zKJk5OtD+Obzpe4xgl03pXZei/IFf+lOnXVAjzvS4RDR/2ZpTtBgeu+w=
X-Gm-Gg: ASbGnctjp9HtrY1BxJnJmehG54D9XdStL3/VlA5fm+r/7l4DYPGTIefNpO2G3jgbsTn
	aWenGMYGqT71wmYP5aYWVJ+jEA2lrdFeK0oFDyff0inAZqKg6Pl1YZXcyt1QvkBDGF/QvNbbKXm
	/Fg3Q7ENicgPl1g/WCjxgqN7McsaH9yk1W0pZLZz/BN6MkTWWNy1hbFdeRBh3zbvr/73HSILzmF
	L7h1jW1MIpQ9QUxOTjSqTCDH8Enl2d1/mo0C3stXzp4jBEwVimROBmSJwF1tuWTYASuZK6kRlpY
	6hLpxsrS5rUpX44MdwU+j2Fjqtod42USTPWXYp2PZ7/hKWSzT8p7jLzWhjwplLzgE7NVsDFy6yB
	HcqLI
X-Google-Smtp-Source: AGHT+IG00dMv12jC0umB3Lt09xucyX0sB4lIF89e+o3ebb8RZab6sMF+OuJ5xLg48pyt1i2pd8MAYg==
X-Received: by 2002:a05:6e02:12cf:b0:3da:7cb7:79c with SMTP id e9e14a558f8ab-3db842dea53mr103485795ab.13.1747586499665;
        Sun, 18 May 2025 09:41:39 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc48c5c0sm1352708173.88.2025.05.18.09.41.39
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:41:39 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-86135af1045so469666739f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:41:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIxj2wBKujK7QwUUArMFao7I0zogsMp1dXHLegmgf8V3R19uM7DEiQXS5qOK9huyfe5FptVHIp791UUg==@lists.linux.dev
X-Received: by 2002:a05:6602:6cce:b0:86a:93c:f5fb with SMTP id
 ca18e2360f4ac-86a231901efmr1346917139f.1.1747586498864; Sun, 18 May 2025
 09:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-4-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-4-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:41:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nwNrL1bJjqeLaUKxntPbbL=amao=3fLQnVwKt6bFyFw@mail.gmail.com>
X-Gm-Features: AX0GCFvPNTkEIdX7vf-6v-hZnL1kJZY7vaEnvAF5rZAuePObHWHQncZKVmFJnYo
Message-ID: <CAGb2v66nwNrL1bJjqeLaUKxntPbbL=amao=3fLQnVwKt6bFyFw@mail.gmail.com>
Subject: Re: [PATCH v11 3/8] drm: sun4i: de2/de3: add generic blender register
 reference function
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group.
>
> Prepare for this by adding a function to look the blender reference up,
> with a subsequent patch to add a conditional based on the DE type.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
