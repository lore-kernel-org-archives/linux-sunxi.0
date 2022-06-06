Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBF533CB
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jun 2022 21:18:47 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id t13so21467693wrg.9
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jun 2022 14:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b90hW8drEyy5YYKt22ECTDBgbLU7QvF4PUTDrepHozg=;
        b=EviXLTC+O0326MiB+E0EQ4e2BWONx/XIdbjQNzoIDhKJM/Uej5bJMJ4EaZ0hviASdA
         PwDpvTuFrmHBJRTsacj6WByLrRcJ4ihseBuzy0eqju2mgloCjodOSh7N4DgVx6uowQ5l
         W8fTB8GVLm9Xrlf9KvDsDR0zjVeEjBNLWqRH55r/GM/rdlkr75PkLh2+IJ/fm2h5nBuP
         exTBMIp+T+Z1U4kFfmZ2b78SvMKaXwmSsNH6dXJo8xYP7drb/ee5/FJDzz58QUlkPGfF
         1iYfAH+cKi0AW+ds6O+vgmKyP+kAuzQBubDK0k/4QmUeANxfKAgLM1Mvm+P7VWhW/e0J
         TYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b90hW8drEyy5YYKt22ECTDBgbLU7QvF4PUTDrepHozg=;
        b=xS0A9JYWCNhGZr5sfZl0I+luRfpXSWT/m89b/Tf7upMjUVzTwI4ui3Va/uIOZJ0qzp
         sUbJGnMbPjpORYGJJMZcXoj8Gm3vWTvj9F2gQ57/3cevxlBmBCTKhUDpr3yQgtTZon6H
         d8VtnNWVcKd5KKooy//ROdTZO31wn+iwdeTV9yGmFJskC2K2lPr/mJm0kEIVN/zW2z+v
         U8oY88N0CJ+hMlkhbwyeOmnwD5h4VtGuDZLtze/uVu7TqlcvVu0wyhJCtUOpxNf4P5+q
         9Bj+/J3UcPi/iIc01/I6O3jQHTKoxzkSYZRVU1fUcJkOm8srW4xHvBifwczjlBcIzYRk
         39Rw==
X-Gm-Message-State: AOAM531sA0sF+1Wm3mNTO9b6p4DWgvUibRU0uBg5II9Zx6FmHnPLLiJU
	w7nBjIOEIRg6FgFWu4fuiQ0=
X-Google-Smtp-Source: ABdhPJzKxihbpGpcKekDPf0iLWBTi+acGwFgbpc62pRVAYpGNuctw/Z5+1aY2B1Iy2Td94WthY69VA==
X-Received: by 2002:adf:a3d3:0:b0:213:baff:7654 with SMTP id m19-20020adfa3d3000000b00213baff7654mr19011995wrb.158.1654550325795;
        Mon, 06 Jun 2022 14:18:45 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id l9-20020a7bc349000000b0039746638d6esm18144278wmj.33.2022.06.06.14.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 14:18:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: Re: [PATCH] ARM: dts: sun5i: adjust whitespace around '='
Date: Mon, 06 Jun 2022 23:18:44 +0200
Message-ID: <5572060.DvuYhMxLoT@kista>
In-Reply-To: <1893171.PYKUYFuaPT@kista>
References: <20220526203547.830848-1-krzysztof.kozlowski@linaro.org> <1893171.PYKUYFuaPT@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 26. maj 2022 ob 22:47:30 CEST je Jernej =C5=A0krabec napi=
sal(a):
> Dne =C4=8Detrtek, 26. maj 2022 ob 22:35:46 CEST je Krzysztof Kozlowski=20
napisal(a):
> > Fix whitespace coding style: use single space instead of tabs or
> > multiple spaces around '=3D' sign in property assignment.  No functional
> > changes (same DTB).
> >=20
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!

Best regards,
Jernej


