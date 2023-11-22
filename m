Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0FD59B56
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Nov 2023 16:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-da3b4b7c6bdso6832837276.2
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Nov 2023 08:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700670999; x=1701275799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnNltyNH2Qapz/Qt/SgTE3LNVbUWrueMgIGKLwuGujM=;
        b=haF3kOwy+q+LiJEjlnoT44e7j5eEqJld0DzjTBn0h3TV35dJBErB/9UvfYKrMHjjZC
         pfeCq0cfQ1Nb0BtSwJABpluqKm8neOPaVIDlYlC0Dtmo+xZodV0mWT9/ZGhpjT8W4klm
         MP+TyYzepX3rT9E/eyf2aFy4JSkKhi0aPLZr/7vk8xsR7S7LgaLgdJ5VTPl4vLqKQqJG
         NuQA/aLwZfT8XtNX051qrnzgvpxiDterp/cZGGCpbCD9WBSrsHb0weL6p4Gy2JFxPdI7
         05zCk8OFMfKejHH4MwKkeLibHDGCaZyTzSVW+IuZ9xPA1k0DOFD+UydN2HfwuvDtq88T
         XHZA==
X-Gm-Message-State: AOJu0Yw5hRmC0iVGSxPjF582Nf2yqHQ0m1Db8PekrYIWDnxzsgK9TN5l
	GmhYK9psgeXvDN4r9vltWLfhOwyib0jrzA==
X-Google-Smtp-Source: AGHT+IGF8ZmQQv1oRiV1RJCsK5vvik8lXt9f8cgSqv/M8nELW1rIiRMB6owzDqYkw5YRXrdb86CskA==
X-Received: by 2002:a25:6605:0:b0:da3:ab41:33c6 with SMTP id a5-20020a256605000000b00da3ab4133c6mr2562775ybc.65.1700670998802;
        Wed, 22 Nov 2023 08:36:38 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id u9-20020a256009000000b00d677aec54ffsm1436761ybb.60.2023.11.22.08.36.38
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 08:36:38 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5c85e8fdd2dso55845107b3.2
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Nov 2023 08:36:38 -0800 (PST)
X-Received: by 2002:a0d:d78f:0:b0:5a8:22b5:399c with SMTP id
 z137-20020a0dd78f000000b005a822b5399cmr3089413ywd.24.1700670998325; Wed, 22
 Nov 2023 08:36:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-6-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-6-peterlin@andestech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 17:36:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVL9_VQ7e7-Cr7vcFWqpCTeptczZmgWN4seENcJKTi0eQ@mail.gmail.com>
Message-ID: <CAMuHMdVL9_VQ7e7-Cr7vcFWqpCTeptczZmgWN4seENcJKTi0eQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] riscv: dts: renesas: r9a07g043f: Update
 compatible string to use Andes INTC
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org, 
	devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com, 
	guoren@kernel.org, heiko@sntech.de, irogers@google.com, 
	jernej.skrabec@gmail.com, jolsa@kernel.org, jszhang@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, locus84@andestech.com, magnus.damm@gmail.com, 
	mark.rutland@arm.com, mingo@redhat.com, n.shubin@yadro.com, 
	namhyung@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	peterz@infradead.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	rdunlap@infradead.org, robh+dt@kernel.org, samuel@sholland.org, 
	sunilvl@ventanamicro.com, tglx@linutronix.de, tim609@andestech.com, 
	uwu@icenowy.me, wens@csie.org, will@kernel.org, ycliang@andestech.com, 
	inochiama@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 1:16=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
> The Andes hart-level interrupt controller (Andes INTC) allows AX45MP
> cores to handle custom local interrupts, such as the performance
> counter overflow interrupt.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
