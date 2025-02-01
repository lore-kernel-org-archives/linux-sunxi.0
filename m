Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70421369AA
	for <linux-sunxi@lists.linux.dev>; Sat,  1 Feb 2025 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738406984; cv=none; b=HScI59ha5b+tqzsE0Hasyq7Ertl4n+3IK7zTcX4S5rY11dfZXW3CqsP6/d97McQ36rXcTSNiuvowqggppRK6CtFywkTlfqQUeS+b/WEXDSPQ9yWetXfheeQNjddXLcGiKfJVvzT/nizc476GFjBMpg2tQb0C3qwalaFQ7AgEk8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738406984; c=relaxed/simple;
	bh=/B22Pf1Q1LEbOWQIOojFa5ozInbH7GFfKtk2tqbFAjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TBZMbxFMbMefovcyQkG0nuvTOVjJo5K470BjtkmF7l0uWcmiwzJmd6XK9PD9EgiQht85/U89tCngQ0sX3/FX0kxbJAOnCrf0tUySPtTa0LTOlgsMQEh8OAZyqGm9PDgiW7Y4G1zYic0O+utUIDfgdwA4+JgiC870fgYf5Hvs55s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso2912932e87.2
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Feb 2025 02:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738406977; x=1739011777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/B22Pf1Q1LEbOWQIOojFa5ozInbH7GFfKtk2tqbFAjk=;
        b=XmyEYYeiQXt+aT5qd2VmiZX2UvnRnJSNBrKijK4aPKVQtw4TdUjOY1ahnUgITyC9IH
         ADczZKQmb5HscXUzLGZrieqjcghC+KRow5DoIi8/mNUSbYGEoEdlzA26eMfuLXr0qBJh
         gNU1lFbAkYIE+6A9kR/Y8ve5kF71lXipgnmYACR2jAFcsC2uAvF1wOvn/kW7hC0H4NZP
         zojfzqi6MbrfkR/xaiMd8UqUXVCFKpmXxLa3FAEFomTaW/hNvhwY0gxJWrn6kh9Pr19R
         kobR2BiQQwygCOq5/M6T5WB+3s0Ube1mxYvPY83g/WL4d7vfpQbDiCkDoT5+T+w/aBIA
         MQEw==
X-Gm-Message-State: AOJu0YyB6ZjlvioYJP9C5vj0qvj0bey/nI+YRoEncqoscnpZO/ew2BFV
	bWIqfY8v3SHAP6s5KC6vzbtQYJ3GtUUwYYXtt4c2rlbTT/iryZoGySsKIITn
X-Gm-Gg: ASbGnctZwgxXaO1eELqPQcKxnjR2Fl8Twi6uCg2dC19YNhcAAVJZaieGe1SSs8OLBoz
	L/6G/2/XW8XxtUD6AIhaI+JG7w2vmkujic6ciJ3KVCecEJjuz9gUjB7H8LxxVrxFjP4l9FnE1n/
	uWogjTCwDQPqwXdzGk4+WPu5JZJ+QLNIkasi9Zatt3ZHTxIcWFfNtncaV11aMsuvtfBAglxPPhH
	RQjCbFzLTOIr0j76wM32nq4nmjNwCRQOb3m7Pp2UOXE8McWG5nTR3mZaer0eGq/nR4ao8TEulXC
	sIU6HpS3mbZf3Q9qIosoeZUKHNOGANxn9yJFPNwKIqgy/O1p
X-Google-Smtp-Source: AGHT+IE/izsJ/VsJkiiYWrRWStgm/b3CvKDxWWBO5sdiLQIx/+aSjG/sNeMJypV1xnnot7V+NbnisQ==
X-Received: by 2002:a05:6512:3d21:b0:542:234b:9a6a with SMTP id 2adb3069b0e04-543e4c32c2bmr5015097e87.33.1738406977108;
        Sat, 01 Feb 2025 02:49:37 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb7dcbsm704173e87.201.2025.02.01.02.49.36
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 02:49:36 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so25861831fa.3
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Feb 2025 02:49:36 -0800 (PST)
X-Received: by 2002:a2e:bc0f:0:b0:302:4131:56c2 with SMTP id
 38308e7fff4ca-307968b8e2cmr53207751fa.4.1738406976433; Sat, 01 Feb 2025
 02:49:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250131231455.153447-1-macroalpha82@gmail.com> <20250131231455.153447-2-macroalpha82@gmail.com>
In-Reply-To: <20250131231455.153447-2-macroalpha82@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 1 Feb 2025 18:49:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v65bsWdmG4mLwuUz9RAKGFBjyj0YDXTMcZg7krRcuH0chA@mail.gmail.com>
X-Gm-Features: AWEUYZkHj08AuejAZwQspl3ckJlNuUu0Wojot3XgvMeDb6OyjwsyKUkY_2GYQhY
Message-ID: <CAGb2v65bsWdmG4mLwuUz9RAKGFBjyj0YDXTMcZg7krRcuH0chA@mail.gmail.com>
Subject: Re: [PATCH 1/5] power: supply: axp20x_battery: Fix fault handling for AXP717
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, lee@kernel.org, samuel@sholland.org, 
	jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, sre@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 7:17=E2=80=AFAM Chris Morgan <macroalpha82@gmail.com=
> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Correct the fault handling for the AXP717 by changing the i2c write
> from regmap_update_bits() to regmap_write_bits(). The update bits
> function does not work properly on a RW1C register where we must
> write a 1 back to an existing register to clear it.
>
> Additionally, as part of this testing I confirmed the behavior of
> errors reappearing, so remove comment about assumptions.
>
> Fixes: 6625767049c2 ("power: supply: axp20x_battery: add support for AXP7=
17")
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
