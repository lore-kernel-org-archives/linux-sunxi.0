Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B3133CD
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jun 2023 07:07:27 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-440b69847bfso1619706137.1
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Jun 2023 00:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687417646; x=1690009646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17q09EU5IzKoL+3uRvcJRVxW9WzlvX1kABapaCMfUac=;
        b=0+Y6V7m9AwJTXt46LgUkmYfim0kFMAgmEx1WMAnwXRm9h0dDSj503PWiVpc80KV24O
         KTY8IXnHqev0sM8Wb5C+Cl0yjpi/6y19OHSQMukXaniD2YHOOOVUOTvKYtXhPZVMbcpM
         ulOevy0MmWgkN2XDTVz7bDCuntnRsnSDLmlbJi3KPdwPaQYvuClYduSlqeaikjIct1gi
         nGZZui1U3Hb8LmO4j9X0yqNFX1575QQuY9mOWj4iwYVZEbvHZNK5qc/og9iqmwvh5Dfo
         ASu0KGaBHmPs30hpp3a/u77l10PYqSUOZbg60pLMKAsdHShEZ5PMbtIS1OZfJZpaQ2oW
         HOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687417646; x=1690009646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17q09EU5IzKoL+3uRvcJRVxW9WzlvX1kABapaCMfUac=;
        b=RFL6k07JW1IkQUTPvO6YwLq4TiqeG2vCdm204PAFJ4fIWknzIsPWzAsAw7SlOFye69
         tMKXCXmbCDTp14JNOys6JfpZJ3L3OsfGepdZZkdWwKoPzoHh2oNI9bFHl5xKAoQVCKdI
         8TPvZqw8A71ifHldbVE6uUfT/PVtqRu7Q9s3g09w+fXYvErbVlCHwbXKX9srkw/DyVYu
         ceANH30eVDNrifiuMDSuKAEQLKPq81h6TQ+MW6LBDOXAIpiD/LdeJ6uPihaTcTwzpCWV
         97wlwy2KISy+FszYH86kx3E+gdN1QXYzY3f/foRWyEF61MOx3FzpfZlztTU8CTwSCfjI
         wsXw==
X-Gm-Message-State: AC+VfDwz1udNZ7u34AJ8UyM9cNjsWD2TfxKsIXys2YLo+Tkq7ZJYCYgI
	7T8PsliDXGOO8DUVpU+uw4If0wOHwewkYjxaeI9ymA==
X-Google-Smtp-Source: ACHHUZ7kZNJcPPkpnbMNtbJXqOpZWeAzoHNc+qihd4tsRK7miMwwfvPuvxGMJdu+kyR+2dT9AG50FXasvP9ps+v0mWc=
X-Received: by 2002:a67:f256:0:b0:43f:5036:677e with SMTP id
 y22-20020a67f256000000b0043f5036677emr7745188vsm.6.1687417646581; Thu, 22 Jun
 2023 00:07:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230621182558.544417-1-brgl@bgdev.pl> <20230621131222.071b9fc3@kernel.org>
In-Reply-To: <20230621131222.071b9fc3@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Jun 2023 09:07:15 +0200
Message-ID: <CAMRc=MddPhRq9aR3ebeEqWs6O_G50TZqBMtCtpDxo8KcRMoiww@mail.gmail.com>
Subject: Re: [PATCH net-next 00/12] net: stmmac: replace boolean fields in
 plat_stmmacenet_data with flags
To: Jakub Kicinski <kuba@kernel.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Richard Cochran <richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 10:12=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Wed, 21 Jun 2023 20:25:46 +0200 Bartosz Golaszewski wrote:
> > As suggested by Jose Abreu: let's drop all 12 boolean fields in
> > plat_stmmacenet_data and replace them with a common bitfield.
>
> Is that what Jose meant, or:
>
> -       bool has_integrated_pcs;
> +       u32 has_integrated_pcs:1;
>
> ?

For that to work all fields would need to be gathered together (unless
the structure is __packed - not a good idea) and all future fields
would need to be added in a specific place in the structure definition
as well. I think a bit field is clearer and harder to get wrong here.

Bart
