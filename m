Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706A04A80
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Mar 2022 13:46:10 +0000 (UTC)
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MbBUc-1o36h52vNY-00bZw7 for <linux-sunxi@lists.linux.dev>; Tue, 08 Mar
 2022 14:40:55 +0100
Received: by mail-wr1-f51.google.com with SMTP id j26so18244594wrb.1
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Mar 2022 05:40:55 -0800 (PST)
X-Gm-Message-State: AOAM530GTlVq5U8etJ2Xs6q6mPJfPmicdCbOmTKs/js98sa295UW5nfo
	f8aP2Mmc863A3m35TUGmVI6z9qR5ikntoWokb5c=
X-Google-Smtp-Source: ABdhPJy4i4S2Td2DIwViO6a2d4Sf3lMdP84U7BC96iZ7illHQ8jOEHBv73Ig/cIeTLgrsoD3sDhn22NUtkKMGcU2wFI=
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr13058079wrh.407.1646746855181; Tue, 08
 Mar 2022 05:40:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-14-andre.przywara@arm.com> <CAK8P3a1FxfZj0=T=cvLNfagP+c_d+SEYYuV30+-UTU+B+HVXmQ@mail.gmail.com>
 <20220308120750.0bbe0122@donnerap.cambridge.arm.com>
In-Reply-To: <20220308120750.0bbe0122@donnerap.cambridge.arm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Mar 2022 14:40:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3g_zPW5xEFRku3TsZTdovevwyxyWVaN_=eD+FN2G8YLg@mail.gmail.com>
Message-ID: <CAK8P3a3g_zPW5xEFRku3TsZTdovevwyxyWVaN_=eD+FN2G8YLg@mail.gmail.com>
Subject: Re: [PATCH 13/14] ARM: configs: sync multi_v5_defconfig from savedefconfig
To: Andre Przywara <andre.przywara@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
	Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	George Hilliard <thirtythreeforty@gmail.com>, DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:cVeRaJWA/MHqn5GYifQNkrYuBILhTj34Xgf0hQKzCuX3gI5l/BU
 yK9VfbIymU9J17mQK3jjC7klTp/15dmHY0ENG5FAqXIXOhfDP4sZ5xq0gTCDB+E77ADWp5q
 5qO+Nfbi2+0ZGEr4g9OITH/pS11XU35xTm0E+22tAj+IHsueerJaSv7CG8IXLGuw/5MV/Ce
 rFie8+PBIFxlppXqSfX0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FsPrY9iofoE=:n1eyH2BDS8fWOAj/hx1uuP
 pGv4SthrCt1Q4CsNwiF6px6i1P7qcaiRst2uDQPeAxxybXUjjSvTO/ggrTZQsBa5WexZCNo3U
 mNSDVYrdeyd2QGL+7Td12M87/k9UtumePuhID7gEEJZTlbphcl13OAvB5sGUtFEXYIPUFNwth
 +ONCU8g3aUqxu4XgQslWxQ1q2bC77tgq45Xql1i+kjE/HstPQpBcwKdOjYKo8gUwGh/0zm4YF
 48+UDa97U2lyc4Af/WpsY/kfAUsSjuPBSmsoZg5NDON/IY8HxVhyJNsOmBnGDX+9xDPFwtPMR
 CsPmn9+rdI4d4NDvwCCsrxxoyEoUrCvG+PMXcL7qpV0TEiEHpPAQd1lwAJEq12aaBDI/6t+hx
 x8ElU1k5+qzdOb17dgY2ijRjRrfELn16UF47AwAcyOD8dgXi4MSBgVW2MWnx+TWWyx+V89BNh
 iuGx7MxOlk2ZGvJWRkYGNv2UTTR26SM4emYmqrt1bLLgYhoddB+tOfteephsstZk+JUPDy4xw
 LboAC7dm/LP/rzBdNaTvwdQi5N/B/PO9daUg4Q6NiUTGTKOYKnWk8AtglP7tOSUlTh9evXjwc
 Q45T7LkVDiCXZoMEqhAotSnbbdur9UVxRhD3AjPC1ex5AuZYXFRX4KO6LGP4xumKlI7dscaOQ
 GLDqA02b8RKoLkbwllyqXNSi6CNoFrPZhxCciXkfm0Qek5cWmxLnqdRxb+pS9wh3BMO1xkbZQ
 zWkrNicZU4shOyZFWDPewXblDKyVPVjBz7o+BbpnVDMjOAF4v+H9ObatnWK1SDxvPY1oHmGb5
 HrwLba+OXg7DKowukRMCdNIFywgve33PQyh0D6+YyQCI7KgUEY=

On Tue, Mar 8, 2022 at 1:07 PM Andre Przywara <andre.przywara@arm.com> wrote:
> If you find that useful, I can try to find those dependency chains for the
> other options, but I definitely lack the knowledge about the history of
> those old platforms, so I can't reason about them. But I could present you
> the findings and you can then say what to do?

Back to this point: the most interesting ones are those that broke because of
some added dependency, or an option that got renamed. This is what I would
use to find the root cause in a scripted way (after identifying the last "good"
version):

$ git bisect run bash -c "make -s O=obj-arm ARCH=arm
multi_v5_defconfig && grep CONFIG_DRM_PANEL_SIMPLE  obj-arm/.config"

You can group the ones that went away because of a deleted platform
or driver, or those that are just default-enabled now, but for cases that
no longer use a driver that may be needed by some platform, just
having the information about what patch broke them usually tells us
what happened. We still need to decide on an appropriate action then,
which could be to include the new dependency explicitly, or to remove
the entire platform that used the driver because we find that the maintainers
never noticed it breaking.

         Arnd
