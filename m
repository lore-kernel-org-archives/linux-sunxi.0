Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E7423A2
	for <linux-sunxi@lists.linux.dev>; Sat,  1 Oct 2022 06:28:13 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id d1-20020a17090a6a4100b002095b319b9aso5054697pjm.0
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Sep 2022 23:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=k2HY/9fTWjD6yOUfkXa90L9vnBK9YBSc4ZyQwrFqunU=;
        b=N6aMnXgZPio+JDqAgd7OoztzGDn5YRVaEHhpQVxjh2Qa4mTgDGjA8NC/4mvctST5xW
         smeisubUybmDrk14fWCj1EDsnVZfbZOkKA/1Pxys/GqDmnohuonql4qYjXYLw4pS2S05
         xTWqIVq4bRe9GvSmSM4cZnAb+lSznS3slJhvL2IUtvQjS9O9vn5pjv/z1pwHjDTKp7/U
         KM30Kl9ak5T5/v7C3sxP8aRZubIRCw7t8bd1yyV3/GwX8TM7lne/ME3ezDpqVcDCnoQH
         6i9cLiUsaOm1yntVBuiJgLinn6hZtIb3wOcryJwC76FvFEEcsi0Pd/31Z5GddirzhEaP
         yhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=k2HY/9fTWjD6yOUfkXa90L9vnBK9YBSc4ZyQwrFqunU=;
        b=aa0Vw07eQD5/25zDiQvrQMhkSa8mQOiK6bz4p7PCjntwE+pgCmoIM2DSNkEHovqJdw
         0LyOszQTiG2bSDdD6V6lks6NQ+FkDy/QAiXCrWo/vDqb5pv4xIjkWFh4ULIzqVYrzCgL
         6luBF6cvKq48SJXSRVX/YghzSPTaBxf2wzVwyI4LpCzHbTw0Mz+AuekK2vtOgkBsmAWv
         stAOCpSl5DMfzyOwWWDg44prSiBKCtxYt+WiZmBSVWsNQSIdWDaCtak54E3RFzZMqJO3
         mdhuVZnTOj+fyMhquUr378lyOP8g9ty1se+dNhpcSQgQfdLc1WEEr2CxTWHUc87/BTYa
         LpjA==
X-Gm-Message-State: ACrzQf1erzVKGV2VuQ2jSU8VY9Klvhrjkk5GWUH/kwOOTXKn1sgXtNsM
	CJpc9ZdnmTZ+6+qsF4i9DGk=
X-Google-Smtp-Source: AMsMyM5hUfLusi1pDlwlsfEM1qZvQ6LzZmDCgYBkMt8EErnV2H9a+OTQit3hERCFi0h8OWG9Oks4Vw==
X-Received: by 2002:a17:902:8217:b0:176:e41d:b804 with SMTP id x23-20020a170902821700b00176e41db804mr12308819pln.111.1664605692437;
        Fri, 30 Sep 2022 23:28:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:63e7:415:943b:4707])
        by smtp.gmail.com with ESMTPSA id y8-20020a62ce08000000b0055817a49b28sm2946161pfg.67.2022.09.30.23.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 23:28:11 -0700 (PDT)
Date: Fri, 30 Sep 2022 23:28:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-input <linux-input@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Ondrej Jirman <x@xff.cz>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 2/4] Input: pinephone-keyboard - Add PinePhone
 keyboard driver
Message-ID: <Yzfd+GC7mH3P2Y0Y@google.com>
References: <20220618165747.55709-1-samuel@sholland.org>
 <20220618165747.55709-3-samuel@sholland.org>
 <CAHp75VcXNTxusT5N_8JvYWMhUyY_sAUzTcT3h0hz2bAawv6ThQ@mail.gmail.com>
 <2e6499b8-d8f4-b63a-689b-1e93aca7c210@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e6499b8-d8f4-b63a-689b-1e93aca7c210@sholland.org>

On Mon, Jun 20, 2022 at 11:12:46PM -0500, Samuel Holland wrote:
> On 6/19/22 6:43 AM, Andy Shevchenko wrote:
> > On Sat, Jun 18, 2022 at 7:10 PM Samuel Holland <samuel@sholland.org> wrote:
> >>
> >> The official Pine64 PinePhone keyboard case contains a matrix keypad and
> >> a MCU which runs a libre firmware. Add support for its I2C interface.
> > 
> > ...
> > 
> >> +#include <linux/crc8.h>
> >> +#include <linux/i2c.h>
> >> +#include <linux/input/matrix_keypad.h>
> >> +#include <linux/interrupt.h>
> >> +#include <linux/module.h>
> >> +#include <linux/regulator/consumer.h>
> > 
> > Missed
> > types.h
> > 
> > ...
> > 
> >> +#define PPKB_ROWS                      6
> >> +#define PPKB_COLS                      12
> > 
> > ...
> > 
> >> +       for (col = 0; col < PPKB_COLS; ++col) {
> >> +               u8 old = old_buf[1 + col];
> >> +               u8 new = new_buf[1 + col];
> >> +               u8 changed = old ^ new;
> >> +
> >> +               if (!changed)
> >> +                       continue;
> >> +
> >> +               for (row = 0; row < PPKB_ROWS; ++row) {
> >> +                       u8 mask = BIT(row);
> >> +                       u8 value = new & mask;
> >> +                       unsigned short code;
> >> +                       bool fn_state;
> >> +
> >> +                       if (!(changed & mask))
> >> +                               continue;
> >> +
> >> +                       /*
> >> +                        * Save off the FN key state when the key was pressed,
> >> +                        * and use that to determine the code during a release.
> >> +                        */
> >> +                       fn_state = value ? ppkb->fn_pressed : ppkb->fn_state[col] & mask;
> >> +                       if (fn_state)
> >> +                               ppkb->fn_state[col] ^= mask;
> > 
> > Can't it be converted to use bitmap APIs?
> 
> This is a 2D matrix, with one byte per column, and one bit per row. There are
> only 6 rows, so two bits per byte are unused. Converting this to the bitmap API
> would unnecessarily complicate things.

We could have a constant bitmap masking the unused bits so they are
always skipped.

Anyway, I made a few edits and applied, we can continue improving the
driver in an iterative manner.

Thanks.

-- 
Dmitry
